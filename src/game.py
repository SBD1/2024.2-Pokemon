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
