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
            # Criar mochila
            self.cur.execute("INSERT INTO mochila (mochila_id, qtd_itens, item) VALUES (DEFAULT, 0, 1) RETURNING mochila_id")
            mochila_id = self.cur.fetchone()[0]
            
            # Criar time
            self.cur.execute("INSERT INTO time (time_id, qtd_pokemons) VALUES (DEFAULT, 1) RETURNING time_id")
            time_id = self.cur.fetchone()[0]
            
            # Criar treinador
            self.cur.execute("""
                INSERT INTO treinador (treinador_id, time, mochila, local_id, tipo_treinador) 
                VALUES (DEFAULT, %s, %s, 1, 'Player') RETURNING treinador_id
            """, (time_id, mochila_id))
            treinador_id = self.cur.fetchone()[0]
            
            # Criar PC (player)
            self.cur.execute("""
                INSERT INTO pc (player_id, treinador_id, nome, num_insigneas)
                VALUES (DEFAULT, %s, %s, 0)
            """, (treinador_id, name))
            
            self.conn.commit()
            return True
        except Exception as e:
            print(f"Erro ao criar jogador: {e}")
            self.conn.rollback()
            return False 