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
            
            # Criar mochila com 5 Pokébolas
            self.cur.execute("""
                INSERT INTO mochila (qtd_itens, pokebolas) 
                VALUES (0, 5) 
                RETURNING mochila_id
            """)
            mochila_id = self.cur.fetchone()[0]
            
            # Criar treinador
            self.cur.execute("""
                INSERT INTO treinador (time, mochila, local_id, tipo_treinador)
                VALUES (%s, %s, 0, 'player') 
                RETURNING treinador_id
            """, (time_id, mochila_id))
            treinador_id = self.cur.fetchone()[0]
            
            # Criar jogador
            self.cur.execute("""
                INSERT INTO pc (treinador_id, nome)
                VALUES (%s, %s)
            """, (treinador_id, name))
            
            # Adicionar Pokémon inicial ao time
            self.cur.execute("""
                INSERT INTO inst_pokemon (pokedex, time, experiencia, vida_atual, status, nivel)
                VALUES (%s, %s, 0, 100, 'Vivo', 1)
            """, (starter_pokemon_id, time_id))
            
            self.conn.commit()
            return True
        except Exception as e:
            self.conn.rollback()
            print(f"Erro ao criar jogador: {e}")
            return False
        
    def mudar_loc(self,new_loc,player_id):
        self.cur.execute("""
            UPDATE treinador
            SET local_id = %s
            WHERE treinador_id = (select treinador_id from pc where player_id = %s)
        """, (new_loc, player_id))
        self.conn.commit()
    
    def search_players(self):
        self.cur.execute("""
            select player_id, nome, num_insigneas from pc
        """)
        return self.cur.fetchall()

    def search_time(self, player_id):
        self.cur.execute("""
            select pkk.inst_pokemon, pk.nome, pkk.vida_atual, pkk.status, pkk.nivel from pokemon pk
            inner join (select ip.pokedex, ip.vida_atual, ip.status, ip.nivel, ip.inst_pokemon from inst_pokemon ip
            inner join (select * from treinador t
            inner join (select * from pc p
            where p.player_id = %s) pl
            on t.treinador_id = pl.treinador_id) tp
            on tp."time" = ip."time" and ip.integra_time = TRUE) pkk
            on pk.pokemon_id = pkk.pokedex
            order by pkk.inst_pokemon;
        """,(player_id,))
        return self.cur.fetchall()

    def search_candidato_time(self, player_id):
        self.cur.execute("""
            select pkk.inst_pokemon, pkk.integra_time, pk.nome, pkk.vida_atual, pkk.status, pkk.nivel from pokemon pk
            inner join (select ip.pokedex,ip.integra_time, ip.vida_atual, ip.status, ip.nivel, ip.inst_pokemon from inst_pokemon ip
            inner join (select * from treinador t
            inner join (select * from pc p
            where p.player_id = %s) pl
            on t.treinador_id = pl.treinador_id) tp
            on tp."time" = ip."time") pkk
            on pk.pokemon_id = pkk.pokedex
            order by pkk.inst_pokemon;
        """,(player_id,))
        return self.cur.fetchall()

    def search_pokemons(self, player_id):
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

    def search_pokemons(self, player_id):
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
                SELECT i.item_id, i.tipo, ii.quantidade
                FROM inst_item ii
                JOIN item i ON ii.item = i.item_id
                WHERE ii.mochila = (
                    SELECT mochila FROM treinador
                    WHERE treinador_id = (
                        SELECT treinador_id FROM pc
                        WHERE player_id = %s
                    )
                );
            """, (player_id,))
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
    
    def curar_pokemons(self, player_id):
        self.cur.execute("""
            UPDATE inst_pokemon
            SET vida_atual = 100, status = 'Vivo'
            WHERE time IN (
                SELECT time FROM treinador
                WHERE treinador_id = (
                    SELECT treinador_id FROM pc
                    WHERE player_id = %s
                )
            )
        """, (player_id,))
        self.conn.commit()
        
    def get_pokemart_items(self):
        self.cur.execute("""
            SELECT item_id, tipo, preco FROM item;
        """)
        return self.cur.fetchall()

    def get_player_coins(self, player_id):
        self.cur.execute("""
            SELECT moedas FROM pc WHERE player_id = %s;
        """, (player_id,))
        return self.cur.fetchone()['moedas']

    def buy_item(self, player_id, item_id, item_price):
        try:
            # Verificar saldo do jogador
            self.cur.execute("""
                SELECT moedas FROM pc WHERE player_id = %s;
            """, (player_id,))
            moedas = self.cur.fetchone()['moedas']
            
            if moedas < item_price:
                return False, "Saldo insuficiente"
            
            # Atualizar saldo do jogador
            self.cur.execute("""
                UPDATE pc SET moedas = moedas - %s WHERE player_id = %s;
            """, (item_price, player_id))
            
            # Adicionar item na mochila
            self.cur.execute("""
                update inst_item
                set quantidade = quantidade + 1,
	            mochila = (SELECT mochila FROM treinador WHERE treinador_id = (SELECT treinador_id FROM pc WHERE player_id = %s))
                where item = %s;
            """, (player_id, item_id))
            
            self.conn.commit()
            return True, "Item comprado com sucesso"
        except Exception as e:
            self.conn.rollback()
            return False, str(e)

    def sell_item(self, player_id, item_id):
        try:
            # Verificar quantidade do item na mochila
            self.cur.execute("""
                SELECT quantidade FROM inst_item WHERE mochila = (SELECT mochila FROM treinador WHERE treinador_id = (SELECT treinador_id FROM pc WHERE player_id = %s)) AND item = %s;
            """, (player_id, item_id))
            quantidade = self.cur.fetchone()['quantidade']
            
            if quantidade <= 0:
                return False, "Item não disponível na mochila"
            
            # Atualizar quantidade do item na mochila
            self.cur.execute("""
                UPDATE inst_item SET quantidade = quantidade - 1 WHERE mochila = (SELECT mochila FROM treinador WHERE treinador_id = (SELECT treinador_id FROM pc WHERE player_id = %s)) AND item = %s;
            """, (player_id, item_id))
            
            # Atualizar saldo do jogador
            self.cur.execute("""
                UPDATE pc SET moedas = moedas + (SELECT preco FROM item WHERE item_id = %s) WHERE player_id = %s;
            """, (item_id, player_id))
            
            self.conn.commit()
            return True, "Item vendido com sucesso"
        except Exception as e:
            self.conn.rollback()
            return False, str(e)
    
    def listar_pokemons_lider(self, ginasio_id):
        self.cur.execute("""
            select pk.nome,p.inst_pokemon, p.pokedex, p.vida_atual, p.status, p.nivel from pokemon pk
            inner join (select p.inst_pokemon, p.pokedex, p.vida_atual, p.status, p.nivel from inst_pokemon p
            inner join (select * from treinador t 
            inner join (select l.treinador_id from lider l 
            inner join (select * from ginasio g 
            where g.local_id = %s) g
            on l.lider_id = g.lider) lg
            on t.treinador_id = lg.treinador_id) lt
            on p."time" = lt."time") p
            on pk.pokemon_id = p.pokedex; 
        """,(ginasio_id,))
        return self.cur.fetchall()

    def search_lider(self, ginasio_id):
        self.cur.execute("""
            select * from npc n 
            inner join (select l.treinador_id from ginasio g 
            inner join lider l
            on g.lider = l.lider_id and g.local_id = %s) lg
            on n.treinador_id = lg.treinador_id;
        """,(ginasio_id,))
        return self.cur.fetchall()

    def curar_pokemon_index(self, poke_id):
        self.cur.execute("""
            update inst_pokemon
            set vida_atual = vida_atual + 25
            where inst_pokemon = %s
        """,(poke_id,))
        self.conn.commit()

    def ataque_pokemon(self, poke_id, dano):
        self.cur.execute("""
            update inst_pokemon
            set vida_atual = vida_atual - %s
            where inst_pokemon = %s
        """,(dano,poke_id))
        self.conn.commit()
    
    def listar_ataques(self, poke_id):
        self.cur.execute("""
            select * from tipo t
            inner join (select gp.nome, gp.dano, gp.precisao, gt.tipo_id from golpe_tipo gt 
            inner join (select g.golpe_id, g.nome, g.precisao, g.dano from golpe g 
            inner join (select * from pokemon_golpe pg 
            where pg.pokemon_id = %s) p
            on g.golpe_id = p.golpe_id) gp
            on gp.golpe_id = gt.golpe_id) g
            on t.tipo_id = g.tipo_id
            order by g.tipo_id;
        """,(poke_id,))
        return self.cur.fetchall()

    def atualizar_lider(self,poke_id):
        self.cur.execute("""
            update inst_pokemon
            set vida_atual = 100
            where inst_pokemon = %s
        """,(poke_id,))
        self.conn.commit()

    def gerencia_time(self, poke_id, poke_bool):
        self.cur.execute("""
            update inst_pokemon
            set integra_time = %s
            where inst_pokemon = %s
        """,(poke_bool, poke_id))
        self.conn.commit()
        
    def get_wild_pokemon(self, local_id):
        self.cur.execute("""
            SELECT ps.selvagem_id, p.nome, zc.chance_surgimento
            FROM pokemon_selvagem ps
            JOIN surge s ON ps.selvagem_id = s.selvagem_id
            JOIN zona_de_captura zc ON s.zona_captura_id = zc.zona_de_captura_id
            JOIN pokemon p ON ps.selvagem_id = p.pokemon_id
            WHERE zc.local_id = %s
        """, (local_id,))
        return self.cur.fetchall()
    
    def add_pokemon_to_team(self, player_id, pokemon_id):
        try:
            # Obter o time do jogador
            self.cur.execute("""
                SELECT time FROM treinador WHERE treinador_id = (
                    SELECT treinador_id FROM pc WHERE player_id = %s
                )
            """, (player_id,))
            time_id = self.cur.fetchone()[0]
            
            # Adicionar o Pokémon ao time
            self.cur.execute("""
                INSERT INTO inst_pokemon (pokedex, time, experiencia, vida_atual, status, nivel, integra_time)
                VALUES (%s, %s, 0, 100, 'Vivo', 1, TRUE)
                RETURNING inst_pokemon
            """, (pokemon_id, time_id))
            inst_pokemon_id = self.cur.fetchone()[0]
            
            # Associar o Pokémon ao time
            self.cur.execute("""
                INSERT INTO integra_ao_time (inst_pokemon_id, time)
                VALUES (%s, %s)
            """, (inst_pokemon_id, time_id))
            
            # Atualizar quantidade de Pokémon no time
            self.cur.execute("""
                UPDATE time 
                SET qtd_pokemons = qtd_pokemons + 1 
                WHERE time_id = %s
            """, (time_id,))
            
            self.conn.commit()
            return True, "Pokémon adicionado ao time com sucesso"
        except Exception as e:
            self.conn.rollback()
            return False, str(e)
        
    def get_pokeball_count(self, player_id):
        self.cur.execute("""
            SELECT m.pokebolas
            FROM mochila m
            JOIN treinador t ON m.mochila_id = t.mochila
            JOIN pc p ON t.treinador_id = p.treinador_id
            WHERE p.player_id = %s
        """, (player_id,))
        result = self.cur.fetchone()
        return result[0] if result else 0
    
    def update_pokeball_count(self, player_id, change):
        self.cur.execute("""
            UPDATE mochila
            SET pokebolas = pokebolas + %s
            WHERE mochila_id = (
                SELECT mochila FROM treinador
                WHERE treinador_id = (
                    SELECT treinador_id FROM pc
                    WHERE player_id = %s
                )
            )
        """, (change, player_id))
        self.conn.commit()
    
    def ganhar_batalha(self, player_id, qtd_moedas):
        self.cur.execute("""
            update pc
            set moedas = moedas + %s
            where player_id = %s;
        """,(qtd_moedas,player_id))
        self.conn.commit()

    def verifica_cura(self, player_id):
        self.cur.execute("""
            select ii.quantidade from inst_item ii 
            where mochila = (select mochila from treinador t 
            where treinador_id = (select treinador_id from pc 
            where player_id = %s)) and item = 1;
        """,(player_id,))
        return self.cur.fetchall()

    def usa_cura(self, player_id):
        self.cur.execute("""
            update inst_item 
            set quantidade = quantidade - 1
            where inst_item_id = (select ii.inst_item_id from inst_item ii 
            where mochila = (select mochila from treinador t 
            where treinador_id = (select treinador_id from pc 
            where player_id = %s)) and item = 1);
        """,(player_id,))
        self.conn.commit()

    def add_experience(self, pokemon_inst_id, xp_gained):
        try:
            # Add XP to pokemon
            self.cur.execute("""
                UPDATE inst_pokemon 
                SET experiencia = experiencia + %s
                WHERE inst_pokemon = %s
                RETURNING experiencia, nivel
            """, (xp_gained, pokemon_inst_id))
            
            exp, current_level = self.cur.fetchone()
            
            # Check if should level up (every 100 XP)
            new_level = (exp // 100) + 1
            if new_level > current_level:
                self.level_up_pokemon(pokemon_inst_id, new_level)
                
            self.conn.commit()
            return new_level
        except Exception as e:
            self.conn.rollback()
            print(f"Error adding experience: {e}")
            return current_level

    def level_up_pokemon(self, pokemon_inst_id, new_level):
        try:
            # Update pokemon level
            self.cur.execute("""
                UPDATE inst_pokemon 
                SET nivel = %s
                WHERE inst_pokemon = %s
                RETURNING pokedex
            """, (new_level, pokemon_inst_id))
            
            pokemon_id = self.cur.fetchone()[0]
            
            # Every 5 levels, learn a new move
            if new_level % 5 == 0:
                # Get pokemon types
                self.cur.execute("""
                    SELECT tipo_id FROM pokemon_tipo 
                    WHERE pokemon_id = %s
                """, (pokemon_id,))
                pokemon_types = [row[0] for row in self.cur.fetchall()]
                
                # Get a random move of pokemon's types not yet learned
                self.cur.execute("""
                    SELECT DISTINCT g.golpe_id 
                    FROM golpe g
                    JOIN golpe_tipo gt ON g.golpe_id = gt.golpe_id
                    WHERE gt.tipo_id = ANY(%s)
                    AND g.golpe_id NOT IN (
                        SELECT golpe_id FROM pokemon_golpe 
                        WHERE pokemon_id = %s
                    )
                    ORDER BY RANDOM()
                    LIMIT 1
                """, (pokemon_types, pokemon_id))
                
                new_move = self.cur.fetchone()
                if new_move:
                    self.cur.execute("""
                        INSERT INTO pokemon_golpe (pokemon_id, golpe_id)
                        VALUES (%s, %s)
                    """, (pokemon_id, new_move[0]))
            
            self.conn.commit()
        except Exception as e:
            self.conn.rollback()
            print(f"Error in level up: {e}")