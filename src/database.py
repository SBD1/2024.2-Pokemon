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
            SELECT DISTINCT ON (p.pokemon_id) p.nome, p.pokemon_id, t.nome AS tipo
            FROM pokemon p
            JOIN pokemon_tipo pt ON p.pokemon_id = pt.pokemon_id
            JOIN tipo t ON pt.tipo_id = t.tipo_id
            WHERE p.pokemon_id IN (1, 4, 7)
            ORDER BY p.pokemon_id, t.nome;
        """)
        return self.cur.fetchall()
    
    def get_locations(self,player_id):
        self.cur.execute("""
            SELECT l.local_id, l.tipo_local, l.nome_local, l.nome_cidade FROM local_ l 
            JOIN (SELECT local_id_2 FROM local_leva_local lll 
            JOIN (SELECT t.local_id FROM (SELECT * FROM pc WHERE player_id = %s) p 
            JOIN treinador t ON t.treinador_id = p.treinador_id) pt 
            ON lll.local_id_1 = pt.local_id) ptl 
            ON ptl.local_id_2 = l.local_id;
        """,(player_id,))
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
    def mudar_loc(self,new_loc):
        self.cur.execute("""
            UPDATE treinador
            SET local_id = %s
            WHERE treinador_id = %s
        """, (new_loc, "1"))
        self.conn.commit()
