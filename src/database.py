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
            # Criar time (com time_principal nulo e qtd_pokemons zero)
            self.cur.execute("""
                INSERT INTO time (time_principal, qtd_pokemons) 
                VALUES (NULL, 1) 
                RETURNING time_id
            """)
            time_id = self.cur.fetchone()[0]
            
            # Criar mochila
            self.cur.execute("""
                INSERT INTO mochila (pokedex_id, qtd_itens, item) 
                VALUES (%s, 1, 1) 
                RETURNING mochila_id
            """,(starter_pokemon_id,))
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
                VALUES (%s, %s, 0, 100, 'Vivo', 1)
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
    def mudar_loc(self,new_loc,player_id):
        self.cur.execute("""
            UPDATE treinador
            SET local_id = %s
            WHERE treinador_id = %s
        """, (new_loc, player_id))
        self.conn.commit()
    
    def search_players(self):
        self.cur.execute("""
            select player_id, nome, num_insigneas from pc
        """)
        return self.cur.fetchall()

    def search_time(self, player_id):
        self.cur.execute("""
            select pk.pokemon_id, pk.nome from pokemon pk
            inner join (select ip.pokedex from inst_pokemon ip
            inner join (select * from treinador t 
            inner join (select * from pc p
            where p.player_id = %s) pl
            on t.treinador_id = pl.treinador_id) tp
            on tp."time" = ip."time") pkk
            on pk.pokemon_id = pkk.pokedex;
        """,(player_id,))
        return self.cur.fetchall()

    def search_itens(self, player_id):
        self.cur.execute("""
            select mpi.quantidade, imm.tipo from item imm
            inner join (select * from inst_item ii 
            inner join (select m.mochila_id from mochila m
            inner join (select * from pc p
            inner join treinador t
            on p.treinador_id = t.treinador_id and p.player_id = %s) pt
            on pt.mochila = m.mochila_id) mp
            on mp.mochila_id = ii.mochila) mpi
            on imm.item_id = mpi.item;
        """,(player_id,))
        return self.cur.fetchall()
    def consulta_local(self, player_id):
        self.cur.execute("""
            select l.local_id,l.nome_cidade,l.nome_local,l.tipo_local from local_ l 
            inner join (select t.local_id from pc p
            inner join treinador t
            on p.treinador_id = t.treinador_id and p.player_id = %s) pt
            on l.local_id = pt.local_id;
        """,(player_id,))
        return self.cur.fetchall()
