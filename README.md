# 2024.2-Pokemon

Bem-vindo ao repositório do grupo 2 para o desenvolvimento do jogo Pokémon, de acordo com os conteúdos ministrados na disciplina Sistema de Banco de Dados 1.

## Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [O Jogo](#o-jogo)
- [Disciplina](#disciplina)
- [Configuração do Ambiente](#configuração-do-ambiente)
- [Como Executar](#como-executar)
- [Entregas](#entregas)
- [Apresentações](#apresentações)

## Sobre o Projeto

Este projeto tem como objetivo desenvolver um jogo baseado no universo Pokémon, utilizando conceitos e técnicas aprendidas na disciplina de Sistema de Banco de Dados 1. O projeto envolve a criação de um banco de dados para armazenar informações sobre Pokémon, treinadores, batalhas, entre outros.

## O Jogo

O jogo Pokémon é um RPG onde os jogadores assumem o papel de treinadores de Pokémon, capturando e treinando criaturas chamadas Pokémon para batalhar contra outros treinadores. O objetivo é se tornar o melhor treinador de Pokémon, capturando todos os Pokémon e vencendo todas as batalhas.

## Disciplina

A disciplina Sistema de Banco de Dados 1 aborda os seguintes tópicos:
- Modelagem de dados
- Criação e manipulação de bancos de dados
- Consultas SQL
- Integridade e segurança de dados


## Configuração do Ambiente

### Pré-requisitos

- Docker
- Python 3.12
- Virtualenv

### Passos para Configuração

1. Clone o repositório:
    ```sh
    git clone https://github.com/SBD1/2024.2-Pokemon.git
    cd 2024.2-Pokemon
    ```

2. Crie e ative o ambiente virtual:
    ```sh
    python3 -m venv venv
    source venv/bin/activate  # No Windows use `venv\Scripts\activate`
    ```

3. Instale as dependências:
    ```sh
    pip install -r src/requirements.txt
    ```

4. Configure e inicie o Docker:
    ```sh
    docker-compose up --build -d
    ```

## Como Executar

1. Certifique-se de que o ambiente virtual está ativado e o Docker está em execução.
2. Execute o script principal:
    ```sh
    python src/main.py
    ```

## Entregas

### Entrega 1
- [Diagrama Entidade-Relacionamento](https://github.com/SBD1/2024.2-Pokemon/blob/main/docs/Entrega%201/DER.md)
- [Dicionário de Dados](https://github.com/SBD1/2024.2-Pokemon/blob/main/docs/Entrega%201/DD.md)
- [Modelo Entidade-Relacionamento](https://github.com/SBD1/2024.2-Pokemon/blob/main/docs/Entrega%201/MER.md)
- [Modelo Relacional](https://github.com/SBD1/2024.2-Pokemon/blob/main/docs/Entrega%201/MREL.md)

### Entrega 2
- [Data Definition Language](https://github.com/SBD1/2024.2-Pokemon/blob/main/BD/init/01_Tabelas.sql)
- [Data Manipulation Language](https://github.com/SBD1/2024.2-Pokemon/blob/main/BD/init/02_Insert_sem_FK.sql)
- [Data Query Language](https://github.com/SBD1/2024.2-Pokemon/blob/main/BD/03_Consultas.sql)



## Apresentações
| Módulo | Link da Gravação                               |
|--------|------------------------------------------------|
| 1      | [Apresentação Módulo 1](https://www.youtube.com/watch?v=WyXHYP3-kAY) |
| 2      | [Apresentação Módulo 2](https://www.youtube.com/watch?v=k7r0S6V5kNg&feature=youtu.be)  |
| 3      | [Apresentação Módulo 3](https://youtu.be/xWNWN2ZesJM) | 
