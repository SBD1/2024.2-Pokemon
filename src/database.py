import psycopg2
from psycopg2.extras import DictCursor

class Database:
    def __init__(self):
        self.conn = psycopg2.connect(
            host='localhost',
            database='pokemon',
            user='postgres',
            password='password',
            port='5434'
        )
        self.cur = self.conn.cursor(cursor_factory=DictCursor)
    
    def close(self):
        self.cur.close()
        self.conn.close()
    
    def get_starter_pokemon(self):
        self.cur.execute("""
            SELECT p.nome, p.pokemon_id, t.nome as tipo
            FROM pokemon p
            JOIN pokemon_tipo pt ON p.pokemon_id = pt.pokemon_id 
            JOIN tipo t ON pt.tipo_id = t.tipo_id
            WHERE p.pokemon_id IN (1, 4, 7)
        """)
        return self.cur.fetchall()
    
    def get_locations(self):
        self.cur.execute("""
            SELECT local_id, nome_local 
            FROM local_ 
            WHERE tipo_local = 'Zona de Captura'
        """)
        return self.cur.fetchall()
    
    def create_player(self, name, starter_pokemon_id):
        try:
            # Criar time (com time_principal nulo e qtd_pokemons zero)
            self.cur.execute("""
                INSERT INTO time (time_principal, qtd_pokemons) 
                VALUES (NULL, 0) 
                RETURNING time_id
            """)
            time_id = self.cur.fetchone()[0]
            
            # Criar mochila
            self.cur.execute("""
                INSERT INTO mochila (pokedex_id, qtd_itens, item) 
                VALUES (1, 1, 1) 
                RETURNING mochila_id
            """)
            mochila_id = self.cur.fetchone()[0]
            
            # Criar treinador
            self.cur.execute("""
                INSERT INTO treinador (time, mochila, local_id, tipo_treinador) 
                VALUES (%s, %s, 0, 'Player') 
                RETURNING treinador_id
            """, (time_id, mochila_id))
            treinador_id = self.cur.fetchone()[0]
            
            # Criar PC (player)
            self.cur.execute("""
                INSERT INTO pc (treinador_id, nome, num_insigneas)
                VALUES (%s, %s, 0)
            """, (treinador_id, name))
            
            # Criar instância do Pokémon inicial
            self.cur.execute("""
                INSERT INTO inst_pokemon (pokedex, time, experiencia, vida_atual, status, nivel)
                VALUES (%s, %s, 0, 100, 'Normal', 1)
                RETURNING inst_pokemon
            """, (starter_pokemon_id, time_id))
            inst_pokemon_id = self.cur.fetchone()[0]
            
            # Associar o Pokémon inicial ao time
            self.cur.execute("""
                INSERT INTO integra_ao_time (inst_pokemon_id, time)
                VALUES (%s, %s)
            """, (inst_pokemon_id, time_id))
            
            # Atualizar quantidade de Pokémon no time
            self.cur.execute("""
                UPDATE time 
                SET qtd_pokemons = 1 
                WHERE time_id = %s
            """, (time_id,))
            
            self.conn.commit()
            return True
        except Exception as e:
            print(f"Erro ao criar jogador: {e}")
            self.conn.rollback()
            return False 