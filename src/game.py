import questionary
from database import Database
from art import text2art

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
            elif choice == "Ver Mochila":
                self.show_bag()
            elif choice == "Sair do Jogo":
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
            self.db.mudar_loc(locations[chosen_index][0],self.player_id)
            # Implementar lógica de encontros com Pokémon selvagens
    
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
            print(f"{item[1]} - {item[0]}")
    
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
            print("iniciando batalha pokemon!".center(40))
            print("="*40 + "\033[0m")
            pokemons_lider = self.db.listar_pokemons_lider(local[0][0])
            while True:
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
                    pokemons_time = self.db.search_time(self.player_id)
                    poke_curar = [lista[1]+" ("+str(lista[2])+")" for lista in pokemons_time]
                    escolha_time = questionary.select(
                        "Qual pokemon deseja curar?",
                        choices = poke_curar + ["Nenhum"]
                    ).ask()
                    chosen_poke = escolha_time.split(" ")
                    index = next((i for i, sublista in enumerate(pokemons_time) if chosen_poke[0] in sublista), -1)
                    self.db.curar_pokemon_index(pokemons_time[index][0])

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
