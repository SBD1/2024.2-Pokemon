import psycopg2
from art import text2art
import questionary

def welcome_screen():
    print("Bem vindo ao jogo!")
    print(text2art("Pokemon"))

def main_menu():
    questions = questionary.select(
        "Escolha uma opção:",
        choices=[
            "Novo Jogo",
            "Carregar Jogo",
            "Sair"
        ]
    ).ask()
    return questions

def main():
    welcome_screen()
    option = main_menu()

    if option == 'Novo Jogo':
        print("Iniciando um novo jogo...")
        # Adicione a lógica para iniciar um novo jogo aqui
    elif option == 'Carregar Jogo':
        print("Carregando jogo salvo...")
        # Adicione a lógica para carregar um jogo salvo aqui
    elif option == 'Sair':
        print("Saindo do jogo...")
        return

    con = psycopg2.connect(
        host='localhost',
        database='pokemon',
        user='postgres',
        password='password',
        port='5434'
    )

    cur = con.cursor()
    cur.execute('SELECT * FROM Pokemon')
    res = cur.fetchall()
    print(res)
    con.close()

if __name__ == "__main__":
    main()