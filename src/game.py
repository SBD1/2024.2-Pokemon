import questionary
from database import Database
from art import text2art

class Game:
    def __init__(self):
        self.db = Database()
        
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
                    "Ver Mochila",
                    "Ver Pokédex",
                    "Sair do Jogo"
                ]
            ).ask()
            
            if choice == "Explorar":
                self.explore()
            elif choice == "Ver Time":
                self.show_team()
            elif choice == "Ver Mochila":
                self.show_bag()
            elif choice == "Ver Pokédex":
                self.show_pokedex()
            elif choice == "Sair do Jogo":
                break
    
    def explore(self):
        locations = self.db.get_locations()
        location_choices = [loc['nome_local'] for loc in locations]
        
        chosen_location = questionary.select(
            "Para onde deseja ir?",
            choices=location_choices + ["Voltar"]
        ).ask()
        
        if chosen_location != "Voltar":
            print(f"Explorando {chosen_location}...")
            # Implementar lógica de encontros com Pokémon selvagens
    
    def show_team(self):
        print("Implementar visualização do time")
    
    def show_bag(self):
        print("Implementar visualização da mochila")
    
    def show_pokedex(self):
        print("Implementar visualização da Pokédex")
    
    def run(self):
        self.welcome_screen()
        
        while True:
            choice = self.main_menu()
            
            if choice == "Novo Jogo":
                self.new_game()
            elif choice == "Carregar Jogo":
                print("Implementar carregamento de jogo")
            elif choice == "Sair":
                print("Até a próxima, treinador!")
                break
        
        self.db.close() 