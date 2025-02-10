import questionary
from database import Database
from art import text2art
import random
class Game:
    def __init__(self):
        self.db = Database()
        self.player_nome = "vazio"
        self.player_id = 0
    def welcome_screen(self):
        print("="*40)
        print(text2art("Pokemon"))
        print("="*40)
    
    def main_menu(self):
        choice = questionary.select(
            "O que deseja fazer?",
            choices=[
                "Novo Jogo",
                "Carregar Jogo",
                "Sair"
            ]
        ).ask()
        return choice
    
    def new_game(self):
        # Pedir nome do jogador
        player_name = questionary.text("Qual é o seu nome, treinador?").ask()
        
        # Mostrar Pokémon iniciais disponíveis
        starters = self.db.get_starter_pokemon()
        starter_choices = [f"{pokemon['nome']} ({pokemon['tipo']})" for pokemon in starters]
        
        chosen_starter = questionary.select(
            "Escolha seu Pokémon inicial:",
            choices=starter_choices
        ).ask()
        
        # Pegar ID do Pokémon escolhido
        starter_id = next(pokemon['pokemon_id'] for pokemon in starters 
                         if pokemon['nome'] in chosen_starter)
        
        # Criar novo jogador no banco
        if self.db.create_player(player_name, starter_id):
            print(f"\nParabéns {player_name}! Você escolheu {chosen_starter.split()[0]}!")
            player_inst = self.db.search_players()
            self.player_name = player_name
            resultado = list(filter(lambda x: x[1] == player_name, player_inst))
            self.player_id = resultado[0][0]
            self.game_loop()
        else:
            print("Erro ao criar novo jogo!")
    
    def game_loop(self):
        while True:
            choice = questionary.select(
                "O que deseja fazer?",
                choices=[
                    "Explorar",
                    "Ver Time",
                    "Ver Pokemons",
                    "Ver Mochila",
                    "Gerenciar Time",
                    "Interagir Local",
                    "Usar Item da Mochila",
                    "Sair do Jogo"
                ]
            ).ask()
            
            if choice == "Explorar":
                self.explore()
            elif choice == "Ver Time":
                self.show_team()
            elif choice == "Ver Pokemons":
                self.show_pokemons()
            elif choice == "Interagir Local":
                self.interagir_local()
            elif choice == "Usar Item da Mochila":
                print("a implementar")
            elif choice == "Gerenciar Time":
                self.mudar_time()
            elif choice == "Ver Mochila":
                self.show_bag()
            elif choice == "Sair do Jogo":
                break

    def encontrar_pokemon_selvagem(self, local_id):
        wild_pokemons = self.db.get_wild_pokemon(local_id)
        for pokemon in wild_pokemons:
            if random.random() <= pokemon['chance_surgimento']:
                print("\033[94m" + "="*40)
                print(f"Um Pokémon selvagem {pokemon['nome']} apareceu!".center(40))
                print("="*40 + "\033[0m")
                
                while True:
                    pokeball_count = self.db.get_pokeball_count(self.player_id)
                    print(f"Você possui {pokeball_count} Pokébolas.")
                    
                    escolha = questionary.select(
                        "O que deseja fazer?",
                        choices=[
                            "Tentar Capturar",
                            "Fugir"
                        ]
                    ).ask()
                    
                    if escolha == "Tentar Capturar":
                        if pokeball_count > 0:
                            # Calcular chance de captura
                            capture_chance = random.random()
                            if capture_chance <= 0.5:  # 50% de chance de captura
                                success, message = self.db.add_pokemon_to_team(self.player_id, pokemon['selvagem_id'])
                                if success:
                                    print("\033[92m" + "="*40)
                                    print(f"Você capturou {pokemon['nome']}!".center(40))
                                    print("="*40 + "\033[0m")
                                    self.db.update_pokeball_count(self.player_id, -1)
                                    break
                                else:
                                    print("\033[91m" + "="*40)
                                    print(f"Erro ao capturar Pokémon: {message}".center(40))
                                    print("="*40 + "\033[0m")
                            else:
                                print("\033[93m" + "="*40)
                                print(f"Você falhou em capturar {pokemon['nome']}.".center(40))
                                print("="*40 + "\033[0m")
                            
                            # Atualizar quantidade de Pokébolas
                            self.db.update_pokeball_count(self.player_id, -1)
                        else:
                            print("\033[91m" + "="*40)
                            print("Você não tem Pokébolas suficientes!".center(40))
                            print("="*40 + "\033[0m")
                            break
                    elif escolha == "Fugir":
                        print("\033[93m" + "="*40)
                        print("Você fugiu do Pokémon selvagem.".center(40))
                        print("="*40 + "\033[0m")
                        break
                break
    
    def explore(self):
        locations = self.db.get_locations(self.player_id)
        location_choices = [loc['nome_local']+' '+loc['nome_cidade'] for loc in locations]
        
        chosen_location = questionary.select(
            "Para onde deseja ir?",
            choices=location_choices + ["Voltar"]
        ).ask()
        
        if chosen_location != "Voltar":
            chosen_index = location_choices.index(chosen_location)
            print(f"Explorando {chosen_location}...")
            print(f"teste->{self.player_id}")
            self.db.mudar_loc(locations[chosen_index][0], self.player_id)
            
            # Implementar lógica de encontros com Pokémon selvagens
            self.encontrar_pokemon_selvagem(locations[chosen_index][0])
    
    def show_team(self):
        time = self.db.search_time(self.player_id)
        pokemons = [pokemon[1] for pokemon in time]
        for poke in pokemons:
            print(f"{poke}")

    def show_pokemons(self):
            time = self.db.search_pokemons(self.player_id)
            pokemons = [pokemon[1] for pokemon in time]
            for poke in pokemons:
                print(f"{poke}")
    
    def show_bag(self):
        print("-Item-|-qtd-")
        itens = self.db.search_itens(self.player_id)
        for item in itens:
            print(f"{item[1]} - {item[2]}")
        
        # Mostrar quantidade de Pokébolas
        pokeball_count = self.db.get_pokeball_count(self.player_id)
        #print(f"\nVocê possui {pokeball_count} Pokébolas.")
    
    def interagir_local(self):
        local = self.db.consulta_local(self.player_id)
        print(f"cidade: {local[0][1]} local: {local[0][2]}")
        print(local[0][2])

        if local[0][2].lower() == "pokecenter":
            self.db.curar_pokemons(self.player_id)
            print("\033[92m" + "="*40)
            print("Todos os seus Pokémon foram curados!".center(40))
            print("="*40 + "\033[0m")
        elif local[0][2].lower() == "pokemart":
            print("\033[94m" + "="*40)
            print("Você está na Pokemart!".center(40))
            print("="*40 + "\033[0m")
            self.interagir_pokemart()
        elif local[0][3].lower() == "ginasio":
            lider = self.db.search_lider(local[0][0])
            print(lider[0][4])
            print("\033[31m"+ "="*40)
            print("Iniciando batalha pokemon!".center(40))
            print("="*40 + "\033[0m")
            index_lider = 0
            index_pc = 0
            lider = self.db.search_lider(local[0][0])
            while True:
                pokemons_time = self.db.search_time(self.player_id)
                pokemons_lider = self.db.listar_pokemons_lider(local[0][0])
                #print(pokemons_lider[index_lider])
                
                if pokemons_lider[index_lider][3] <= 0:
                    try:
                        index_lider = index_lider + 1
                        print(f"Lider trocando para {pokemons_lider[index_lider][1]} ...")
                    except Exception as e:    
                        print("Parabens Você ganhou!")
                        for pokemons in pokemons_lider:
                            self.db.atualizar_lider(pokemons[1])
                            self.db.ganhar_batalha(self.player_id,50)

                            # AQUI ADICIONA XP AOS POKEMONS DO TIME!!!
                            for poke in pokemons_time:
                                xp_gained = 50  # Base XP for winning
                                new_level = self.db.add_experience(poke[0], xp_gained)
                                if new_level > poke[4]:  # poke[4] é o nível atual do Pokémon
                                    print(f"Seu Pokémon {poke[1]} subiu para o nível {new_level}!")
                                    if new_level % 5 == 0:
                                        print(f"Seu Pokémon {poke[1]} aprendeu um novo golpe!")
                        break
                
                try:
                    if pokemons_time[index_pc][2] <= 0:
                        try:
                            index_pc = index_pc + 1
                            print(f"trocando seu pokemon para {pokemons_time[index_pc][1]}")
                        except Exception as e:
                            print("Que pena você perdeu :(")
                            for pokemons in pokemons_lider:
                                self.db.atualizar_lider(pokemons[1])
                            break
                except IndexError:
                    print("Não tem pokemons no seu time")
                    break

                print("\033[35m"+ "="*40)
                print(f"{pokemons_lider[index_lider][0]} de {lider[0][2]}".center(40))
                print(f"Nivel: {pokemons_lider[index_lider][5]} Vida: {pokemons_lider[index_lider][3]}hp".center(40))
                print("="*40 + "\033[0m")
                print("\033[33m"+ "="*40)
                print(f"{pokemons_time[index_pc][1]} de {self.player_nome}".center(40))
                print(f"Nivel: {pokemons_time[index_pc][4]} Vida: {pokemons_time[index_pc][2]}hp".center(40))
                print("="*40 + "\033[0m")

                escolha = questionary.select(
                    "O que deseja fazer?",
                    choices=[
                        "Atacar",
                        "Curar um Pokemon",
                        "Trocar Pokemon atual",
                        "Correr"
                    ]
                ).ask()
                if escolha == "Correr":
                    print("Você desistiu de sua batalha :(".center(40))
                    break

                if escolha == "Curar um Pokemon":
                    poke_curar = [lista[1]+" ("+str(lista[2])+")" for lista in pokemons_time]
                    escolha_time = questionary.select(
                        "Qual pokemon deseja curar?",
                        choices = poke_curar + ["Nenhum"]
                    ).ask()
                    if self.db.verifica_cura(self.player_id)[0][0] > 0:
                        if escolha_time != "Nenhum":
                            chosen_poke = escolha_time.split(" ")
                            index = next((i for i, sublista in enumerate(pokemons_time) if sublista[1] == chosen_poke[0]), -1)
                            print(f"Seu {chosen_poke[0]} foi curado!")
                            self.db.curar_pokemon_index(pokemons_time[index][0])
                            self.db.usa_cura(self.player_id)
                    else:
                        print("Você esta sem itens de medicina")
                if escolha == "Trocar Pokemon atual":
                    poke_troca = [lista[1]+" ("+str(lista[2])+")" for lista in pokemons_time]
                    escolha_time = questionary.select(
                        "Qual pokemon quer trocar??",
                        choices = poke_troca + ["Nenhum"]
                    ).ask()
                    if escolha_time != "Nenhum":
                        chosen_poke = escolha_time.split(" ")
                        index = next((i for i, sublista in enumerate(pokemons_time) if sublista[1] == chosen_poke[0]), -1)
                        index_pc = index
                if escolha == "Atacar":
                    ataques = self.db.listar_ataques(pokemons_time[index_pc][0])
                    ataques_lider = self.db.listar_ataques(pokemons_lider[index_lider][1])
                    ataque = [item[2]+" ("+str(item[3])+")" for item in ataques]
                    ataque_feito = questionary.select(
                            "Escolha o ataque a ser feito",
                            choices = ataque + ["Nenhum"]
                    ).ask()
                    if ataque_feito != "Nenhum":
                        atacado = ataque_feito.split("(")
                        ataque = atacado[0].rstrip()
                        index = next((i for i, sublista in enumerate(ataques) if sublista[2] == ataque), -1)
                        if ataques[index][3]:
                            self.db.ataque_pokemon(pokemons_lider[index_lider][1],ataques[index][3])
                        print(f"{pokemons_time[index_pc][1]} usou {ataque} que da {ataques[index][3]} de dano")
                        print(f"{pokemons_lider[index_lider][0]} usou {ataques_lider[0][2]} que da {ataques_lider[0][3]} de dano")
                        #print(pokemons_time[index_pc])
                        self.db.ataque_pokemon(pokemons_time[index_pc][0],ataques_lider[0][3])


    def interagir_pokemart(self):
        while True:
            choice = questionary.select(
                "O que deseja fazer?",
                choices=[
                    "Ver Itens Disponíveis",
                    "Ver Saldo de Moedas",
                    "Comprar Item",
                    "Vender Item",
                    "Sair da Pokemart"
                ]
            ).ask()
            
            if choice == "Ver Itens Disponíveis":
                items = self.db.get_pokemart_items()
                print("\033[94m" + "-Item-|-Preço-" + "\033[0m")
                for item in items:
                    print(f"{item['tipo']} - {item['preco']}")
            elif choice == "Ver Saldo de Moedas":
                moedas = self.db.get_player_coins(self.player_id)
                print(f"\033[93mVocê tem {moedas} moedas.\033[0m")
            elif choice == "Comprar Item":
                items = self.db.get_pokemart_items()
                if not items:
                    print("\033[91mNenhum item disponível para compra.\033[0m")
                    continue
                item_choices = [f"{item['tipo']} ({item['preco']} moedas)" for item in items]
                chosen_item = questionary.select(
                    "Escolha um item para comprar:",
                    choices=item_choices
                ).ask()
                item_id = next(item['item_id'] for item in items if item['tipo'] in chosen_item)
                item_price = next(item['preco'] for item in items if item['tipo'] in chosen_item)
                success, message = self.db.buy_item(self.player_id, item_id, item_price)
                if success:
                    print(f"\033[92m{message}\033[0m")
                else:
                    print(f"\033[91m{message}\033[0m")
            elif choice == "Vender Item":
                itens = self.db.search_itens(self.player_id)
                if not itens:
                    print("\033[91mNenhum item disponível para venda.\033[0m")
                    continue
                item_choices = [f"{item['tipo']} ({item['quantidade']} disponíveis)" for item in itens]
                chosen_item = questionary.select(
                    "Escolha um item para vender:",
                    choices=item_choices
                ).ask()
                item_id = next(item['item_id'] for item in itens if item['tipo'] in chosen_item)
                success, message = self.db.sell_item(self.player_id, item_id)
                if success:
                    print(f"\033[92m{message}\033[0m")
                else:
                    print(f"\033[91m{message}\033[0m")
            elif choice == "Sair da Pokemart":
                break

    def load_game(self):
        players = self.db.search_players()
        lista_players = [player[1] for player in players]
        chosen_player = questionary.select("Escolha seu jogador",lista_players + ["Voltar"]).ask()
        if chosen_player != "Voltar":
            self.player_nome = chosen_player
            resultado = list(filter(lambda x: x[1] == chosen_player, players))
            self.player_id = resultado[0][0]
            self.game_loop()
# [[1, True, 'Bulbasaur', 40, 'Vivo', 1], [2, True, 'Charmander', 100, 'Vivo', 1]]
    def mudar_time(self):
        pokemons_escolha = self.db.search_candidato_time(self.player_id)
        escolher = questionary.select(
                "O que deseja fazer?",
                choices=[
                    "Colocar pokemon no time",
                    "Retirar pokemon do time",
                    "Sair"
                ]
        ).ask()

        if escolher == "Retirar pokemon do time":
            #poke_escolha = [item[2] for item in pokemons_escolha if not item[1]]
            poke_escolha = [item[2] for item in pokemons_escolha if item[1]]
            if len(poke_escolha) == 0:
                print("Não tem pokemons no seu time")
            else:
                a_retirar = questionary.checkbox(
                    "Escolha os pokemons",
                    choices = poke_escolha
                ).ask()
                for poke_name in a_retirar:
                    indice = next((i for i, item in enumerate(pokemons_escolha) if item[2] == poke_name), -1)
                    print(f"{pokemons_escolha[indice][2]} retirado do time")
                    self.db.gerencia_time(pokemons_escolha[indice][0],False)
        
        if escolher == "Colocar pokemon no time":
            poke_escolha = [item[2] for item in pokemons_escolha if not item[1]]
            #poke_escolha = [item[2] for item in pokemons_escolha if item[1]]
            if len(poke_escolha) == 0:
                print("Todos seus pokemons estão no seu time")
            else:
                a_retirar = questionary.checkbox(
                    "Escolha os pokemons",
                    choices = poke_escolha
                ).ask()
                for poke_name in a_retirar:
                    indice = next((i for i, item in enumerate(pokemons_escolha) if item[2] == poke_name), -1)
                    print(f"{pokemons_escolha[indice][2]} adicionado ao time!")
                    self.db.gerencia_time(pokemons_escolha[indice][0],True)
                

    def run(self):
        self.welcome_screen()
        
        while True:
            choice = self.main_menu()
            
            if choice == "Novo Jogo":
                self.new_game()
            elif choice == "Carregar Jogo":
                self.load_game()    
            elif choice == "Sair":
                print("Até a próxima, treinador!")
                break
        
        self.db.close() 
