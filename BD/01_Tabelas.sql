CREATE TABLE Pokemon(
	Pokemon_id int NOT NULL,
	status_base int NOT NULL,
	Nome varchar(20) NOT NULL,
	qtd_tipos int NOT NULL
	CHECK (qtd_tipos = 1 OR qtd_tipos = 2),
	pokedex int NOT NULL,
	CONSTRAINT fk_pokemon
		PRIMARY KEY (pokemon_id)
);



CREATE TABLE Status_base(
	status_base_id int NOT NULL,
	vida int NOT NULL,
	atk int NOT NULL,
	def int NOT NULL,
	velocidade int NOT NULL,
	CONSTRAINT fk_status
		PRIMARY KEY (status_base_id)
);

CREATE TABLE Tipo(
	tipo_id int NOT NULL,
	pokemon_id int NOT NULL,
	Nome varchar(20) NOT NULL,
	CONSTRAINT fk_tipo
		PRIMARY KEY (tipo_id),
	CONSTRAINT fk_pokemon_id
		FOREIGN KEY (pokemon_id)
			REFERENCES Pokemon (pokemon_id)
);



CREATE TABLE Eficacia(
	eficacia_id int NOT NULL,
	multiplicador decimal(2,1) NOT NULL,
	nome varchar(20) NOT NULL,
	CONSTRAINT pk_eficacia
		PRIMARY KEY (eficacia_id)

);

CREATE TABLE Golpe(
	golpe_id int NOT NULL,
	nome varchar(50) NOT NULL,
	categoria varchar(60) NOT NULL,
	dano int DEFAULT 0,
	precisao decimal(2,1) DEFAULT 0
	CHECK (precisao >= 0 AND precisao <= 1),
	num_vezes_usar int NOT NULL,
	efeito varchar(250),
	CONSTRAINT pk_Golpe
		PRIMARY KEY (golpe_id)
);

CREATE TABLE Metodo(
	metodo_id int NOT NULL,
	nome varchar(50) NOT NULL,
	nivel int,
	CONSTRAINT pk_Metodo
		PRIMARY KEY (metodo_id)
);

CREATE TABLE Pokecenter(
	pokecenter_id int NOT NULL,
	time_pric_id int NOT NULL,
	local_id int NOT NULL,
	restaura_pokemon int NOT NULL,
	qtd_npcs int NOT NULL,
	nome_cidade varchar(50),
	CONSTRAINT pk_pokecenter
		PRIMARY KEY (pokecenter_id)

); 



CREATE TABLE Inst_Pokemon(
	inst_pokemon int NOT NULL,
	pokedex int NOT NULL,
	time int NOT NULL,
	experiencia int DEFAULT 0
	CHECK (experiencia >= 0),
	vida_atual int DEFAULT 0,
	status varchar(50) NOT NULL,
	CONSTRAINT pk_inst_pokemon
		PRIMARY KEY (inst_pokemon)
); 



CREATE TABLE Time_Principal(
	time_princ_id int NOT NULL,
	ordem int NOT NULL
	CHECK (ordem >= 1 AND ordem <= 6),
	cura_pokecenter int NOT NULL,
	CONSTRAINT pk_time_princ
		PRIMARY KEY (time_princ_id),
	CONSTRAINT fk_pokecenter
		FOREIGN KEY (cura_pokecenter)
			REFERENCES Pokecenter (PokeCenter_id)
); 

CREATE TABLE Pokemon_Selvagem(
	selvagem_id int NOT NULL,
	taxa_aparicao decimal(3,1) DEFAULT 0 
	CHECK (taxa_aparicao >= 0 AND taxa_aparicao <= 1),	
	CONSTRAINT pk_selvagem
		PRIMARY KEY (selvagem_id)
);

CREATE TABLE Pokedex(
	pokedex_id int NOT NULL,
	num_pokedex varchar(20) UNIQUE,
	CONSTRAINT pk_pokedex
		PRIMARY KEY (pokedex_id)
);

CREATE TABLE Local_(
	local_id int NOT NULL,
	tipo_local varchar(50) NOT NULL,
	nome_local varchar(50) NOT NULL,
	CONSTRAINT pk_local
		PRIMARY KEY (local_id)
);

CREATE TABLE Ginasio(
	ginasio_id int NOT NULL,
	lider int NOT NULL,
	nome varchar(50) NOT NULL,
	local_id int NOT NULL,
	CONSTRAINT pk_ginasio
		PRIMARY KEY (ginasio_id)
);


CREATE TABLE Caminho(
	caminho_id int NOT NULL,
	qtd_itens int DEFAULT 0,
	local_id int NOT NULL,
	CONSTRAINT pk_caminho
		PRIMARY KEY (caminho_id),
	CONSTRAINT fk_local
		FOREIGN KEY (local_id)
			REFERENCES local_ (local_id) 
);

CREATE TABLE Zona_de_captura(
	zona_de_captura_id int NOT NULL,
	chance_surgimento decimal(3,1) DEFAULT 0
	CHECK (chance_surgimento >= 0 AND chance_surgimento <= 1),
	local_id int NOT NULL,
	CONSTRAINT pk_zona_captura
		PRIMARY KEY (zona_de_captura_id),
	CONSTRAINT fk_local
		FOREIGN KEY (local_id)
			REFERENCES local_ (local_id)
);

CREATE TABLE pokemart(
	pokemart_id int NOT NULL,
	qtd_npcs int DEFAULT 0,
	local_id int NOT NULL,
	nome_cidade varchar(50),
	CONSTRAINT pk_pokemart
		PRIMARY KEY (pokemart_id),
	CONSTRAINT fk_local
		FOREIGN KEY (local_id)
			REFERENCES local_ (local_id)
);

CREATE TABLE Time(
	time_id int NOT NULL,
	time_principal int,
	qtd_pokemons int DEFAULT 0,
	CONSTRAINT pk_time
		PRIMARY KEY (time_id),
	CONSTRAINT fk_time_princ
		FOREIGN KEY (time_principal)
			REFERENCES Time_Principal (time_princ_id)
);

CREATE TABLE Treinador(
	treinador_id int NOT NULL,
	time int NOT NULL,
	mochila int NOT NULL,
	local_id int NOT NULL,
	tipo_treinador varchar(50),
	CONSTRAINT pk_treinador
		PRIMARY KEY (treinador_id),
	CONSTRAINT fk_time
		FOREIGN KEY (time)
			REFERENCES Time (time_id),
	CONSTRAINT fk_local
		FOREIGN KEY (local_id)
			REFERENCES local_ (local_id)

);



CREATE TABLE Mochila(
	mochila_id int NOT NULL,
	pokedex_id int,
	qtd_itens int DEFAULT 0,
	CONSTRAINT pk_mochila
		PRIMARY KEY (mochila_id),
	CONSTRAINT fk_pokedex
		FOREIGN KEY (pokedex_id)
			REFERENCES pokedex (pokedex_id)
);


			
CREATE TABLE item(
	item_id int NOT NULL,
	tipo varchar(50) NOT NULL,
	CONSTRAINT pk_item
		PRIMARY KEY (item_id)
);

CREATE TABLE Pokebola(
	pokebola_id int NOT NULL,
	item_id int NOT NULL,
	nome varchar(50) NOT NULL,
	taxa_cura decimal(3,1) DEFAULT 0,
	efeito varchar(150) NOT NULL,
	descricao varchar(150) NOT NULL,
	CONSTRAINT pk_pokebola
		PRIMARY KEY (pokebola_id),
	CONSTRAINT fk_item
		FOREIGN KEY (item_id)
			REFERENCES item (item_id)
);

CREATE TABLE lider(
	lider_id int NOT NULL,
	treinador_id int NOT NULL,
	nome varchar(50) NOT NULL,
	insignea varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	CONSTRAINT pk_lider
		PRIMARY KEY (lider_id),
	CONSTRAINT pk_insignea
		UNIQUE (insignea),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)
);

CREATE TABLE NPC(
	npc_id int NOT NULL,
	treinador_id int NOT NULL,
	nome varchar(50) NOT NULL,
	nivel_dificuldade int DEFAULT 0,
	falas varchar(250),
	CONSTRAINT pk_npc
		PRIMARY KEY (npc_id),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)
);

CREATE TABLE PC(
	player_id int NOT NULL,
	treinador_id int NOT NULL,
	nome varchar(50) NOT NULL,
    num_insigneas int DEFAULT 0,
	CONSTRAINT pk_player
		PRIMARY KEY (player_id),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)
);

CREATE TABLE Utilitario(
	pocao_id int NOT NULL,
	item_id int NOT NULL,
	nome varchar(50) NOT NULL,
    taxa_cura decimal(3,1) DEFAULT 0,
	efeito varchar(150),
	descricao varchar(150),
	CONSTRAINT pk_pocao
		PRIMARY KEY (pocao_id),
	CONSTRAINT fk_item
		FOREIGN KEY (item_id)
			REFERENCES item (item_id)
);

CREATE TABLE Aprende_golpe_metodo(
	metodo_id int NOT NULL,
	golpe_id int NOT NULL,
	CONSTRAINT fk_golpe
		FOREIGN KEY (golpe_id)
			REFERENCES golpe (golpe_id),
	CONSTRAINT fk_metodo
		FOREIGN KEY (metodo_id)
			REFERENCES metodo (metodo_id)
);

CREATE TABLE golpe_eficacia(
	eficacia_id int NOT NULL,
	golpe_id int NOT NULL,
	CONSTRAINT fk_golpe
		FOREIGN KEY (golpe_id)
			REFERENCES golpe (golpe_id),
	CONSTRAINT fk_eficacia
		FOREIGN KEY (eficacia_id)
			REFERENCES eficacia (eficacia_id)
);

CREATE TABLE golpe_tipo(
	tipo_id int NOT NULL,
	golpe_id int NOT NULL,
	CONSTRAINT fk_golpe
		FOREIGN KEY (golpe_id)
			REFERENCES golpe (golpe_id),
	CONSTRAINT fk_tipo
		FOREIGN KEY (tipo_id)
			REFERENCES tipo (tipo_id)
);

CREATE TABLE pokemon_golpe(
	pokemon_id int NOT NULL,
	golpe_id int NOT NULL,
	CONSTRAINT fk_golpe
		FOREIGN KEY (golpe_id)
			REFERENCES golpe (golpe_id),
	CONSTRAINT fk_pokemon
		FOREIGN KEY (pokemon_id)
			REFERENCES pokemon (pokemon_id)
);

CREATE TABLE eficacia_tipo(
	tipo_id int NOT NULL,
	eficacia_id int NOT NULL,
	CONSTRAINT fk_eficacia
		FOREIGN KEY (eficacia_id)
			REFERENCES eficacia (eficacia_id),
	CONSTRAINT fk_tipo
		FOREIGN KEY (tipo_id)
			REFERENCES tipo (tipo_id)
);


CREATE TABLE inst_item(
	inst_item_id int NOT NULL,
	quantidade int NOT NULL,
	mochila int NOT NULL,
	item int NOT NULL,
	CONSTRAINT pk_inst_item
		PRIMARY KEY (inst_item_id),
	CONSTRAINT fk_mochila
		FOREIGN KEY (mochila)
			REFERENCES Mochila (mochila_id),
	CONSTRAINT fk_item
		FOREIGN KEY (item)
			REFERENCES item (item_id)
);


CREATE TABLE negocia(
	pokemart_id int NOT NULL,
	inst_item_id int NOT NULL,
	preco real DEFAULT 0,
	CONSTRAINT fk_pokemart
		FOREIGN KEY (pokemart_id)
			REFERENCES pokemart (pokemart_id),
	CONSTRAINT fk_inst_item
		FOREIGN KEY (inst_item_id)
			REFERENCES inst_item (inst_item_id)
);

CREATE TABLE surge(
	zona_captura_id int NOT NULL,
	selvagem_id int NOT NULL,
	CONSTRAINT fk_zona_captura
		FOREIGN KEY (zona_captura_id)
			REFERENCES zona_de_captura (zona_de_captura_id),
	CONSTRAINT fk_selvagem
		FOREIGN KEY (selvagem_id)
			REFERENCES pokemon_selvagem (selvagem_id)

);

CREATE TABLE caminho_item(
	caminho_id int NOT NULL,
	inst_item_id int NOT NULL,
	CONSTRAINT fk_caminho
		FOREIGN KEY (caminho_id)
			REFERENCES caminho (caminho_id),
	CONSTRAINT fk_inst_item
		FOREIGN KEY (inst_item_id)
			REFERENCES inst_item (inst_item_id)

);

CREATE TABLE local_leva_local(
	local_id_1 int NOT NULL,
	local_id_2 int NOT NULL,
	CONSTRAINT fk_local1
		FOREIGN KEY (local_id_1)
			REFERENCES local_ (local_id),
	CONSTRAINT fk_local2
		FOREIGN KEY (local_id_2)
			REFERENCES local_ (local_id)

);

CREATE TABLE pokemon_tipol(
	tipo_id int NOT NULL,
	pokemon_id int NOT NULL,
	CONSTRAINT fk_tipo
		FOREIGN KEY (tipo_id )
			REFERENCES tipo (tipo_id),
	CONSTRAINT fk_pokemon
		FOREIGN KEY (pokemon_id)
			REFERENCES pokemon (pokemon_id)

);

ALTER TABLE pokemon_tipol
RENAME TO pokemon_tipo;


CREATE TABLE possui(
	inst_pokemon_id int NOT NULL,
	pokemon_id int NOT NULL,
	CONSTRAINT fk_inst_pokemon
		FOREIGN KEY (inst_pokemon_id )
			REFERENCES inst_pokemon (inst_pokemon),
	CONSTRAINT fk_pokemon
		FOREIGN KEY (pokemon_id)
			REFERENCES pokemon (pokemon_id)

);

CREATE TABLE evolucao_pokemon(
	pokemon_id_1 int NOT NULL,
	pokemon_id_2 int NOT NULL,
	nivel_min int DEFAULT 0,
	CONSTRAINT fk_pokemon_id_1 
		FOREIGN KEY (pokemon_id_1 )
			REFERENCES inst_pokemon (inst_pokemon),
	CONSTRAINT fk_pokemon_id_2
		FOREIGN KEY (pokemon_id_2)
			REFERENCES pokemon (pokemon_id)

);

CREATE TABLE upar_pokemon(
	pokemon_id int NOT NULL,
	exp_necessaria int DEFAULT 0,
	nivel int DEFAULT 0,
	CONSTRAINT fk_pokemon 
		FOREIGN KEY (pokemon_id)
			REFERENCES pokemon (pokemon_id)
);

CREATE TABLE encontra(
	selvagem_id int NOT NULL,
	treinador_id int NOT NULL,
	CONSTRAINT fk_selvagem 
		FOREIGN KEY (selvagem_id )
			REFERENCES pokemon_selvagem (selvagem_id),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)

);

CREATE TABLE captura(
	selvagem_id int NOT NULL,
	treinador_id int NOT NULL,
	chance_base decimal(3,1) DEFAULT 0,
	chance_atual decimal(3,1) DEFAULT 0,
	CONSTRAINT fk_selvagem 
		FOREIGN KEY (selvagem_id )
			REFERENCES pokemon_selvagem (selvagem_id),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)

);

CREATE TABLE torna(
	selvagem_id int NOT NULL,
	treinador_id int NOT NULL,
	CONSTRAINT fk_selvagem 
		FOREIGN KEY (selvagem_id )
			REFERENCES pokemon_selvagem (selvagem_id),
	CONSTRAINT fk_treinador
		FOREIGN KEY (treinador_id)
			REFERENCES treinador (treinador_id)

);

CREATE TABLE batalha(
	batalha_id int NOT NULL,
	treinador_id_1 int NOT NULL,
	treinador_id_2 int NOT NULL,
	resultado varchar(20),
    recompensa varchar(150),
	CONSTRAINT pk_batalha_id
		PRIMARY KEY (batalha_id),
	CONSTRAINT fk_treinador_id_1 
		FOREIGN KEY (treinador_id_1 )
			REFERENCES treinador (treinador_id),
	CONSTRAINT fk_treinador_id_2
		FOREIGN KEY (treinador_id_2)
			REFERENCES treinador (treinador_id)

);

CREATE TABLE treinador_interacao(
	treinador_id_1 int NOT NULL,
	treinador_id_2 int NOT NULL,
	CONSTRAINT fk_treinador_id_1 
		FOREIGN KEY (treinador_id_1 )
			REFERENCES treinador (treinador_id),
	CONSTRAINT fk_treinador_id_2
		FOREIGN KEY (treinador_id_2)
			REFERENCES treinador (treinador_id)

);



-- adicionando chaves estrangeiras da tabela status_base
ALTER TABLE Status_base
RENAME CONSTRAINT fk_status
TO pk_status;
--

-- adicionando chaves estrangeiras da tabela pokemon
ALTER TABLE Pokemon
ADD CONSTRAINT fk_status_base
		FOREIGN KEY (status_base)
			REFERENCES Status_base (status_base_id);
			
ALTER TABLE Pokemon
ADD CONSTRAINT fk_pokedex
		FOREIGN KEY (pokedex)
			REFERENCES Pokedex (pokedex_id);
			
ALTER TABLE Pokemon
RENAME CONSTRAINT fk_pokemon
TO pk_pokemon;
--

-- adicionando chaves estrangeiras da tabela inst_pokemon
ALTER TABLE Treinador
ADD CONSTRAINT fk_mochila
		FOREIGN KEY (mochila)
			REFERENCES mochila (mochila_id);
--

-- adicionando chaves estrangeiras da tabela inst_pokemon
ALTER TABLE Inst_Pokemon
ADD CONSTRAINT fk_pokedex
		FOREIGN KEY (pokedex)
			REFERENCES Pokedex (pokedex_id);

ALTER TABLE Inst_pokemon
ADD CONSTRAINT fk_time
		FOREIGN KEY (time)
			REFERENCES Time (time_id);
--

-- adicionando chaves estrangeiras da tabela mochila
ALTER TABLE Mochila
ADD item int NOT NULL;

ALTER TABLE Mochila
ADD CONSTRAINT fk_item
		FOREIGN KEY (item)
			REFERENCES item (item_id);
--

-- adicionando chaves estrangeiras da tabela Ginasio
ALTER TABLE Ginasio
ADD CONSTRAINT fk_local_id
		FOREIGN KEY (local_id)
			REFERENCES Local_ (local_id);
			
ALTER TABLE Ginasio
ADD CONSTRAINT fk_lider
		FOREIGN KEY (lider)
			REFERENCES lider (lider_id);
	  
--

-- adicionando chaves estrangeiras da tabela tipo
ALTER TABLE Pokecenter
ADD CONSTRAINT fk_local_id
		FOREIGN KEY (local_id)
			REFERENCES Local_ (local_id);

ALTER TABLE Pokecenter
ADD CONSTRAINT fk_time_princ
		FOREIGN KEY (time_pric_id)
			REFERENCES Time_Principal (time_princ_id);
--		

-- adicionando chaves estrangeiras da tabela tipo
ALTER TABLE Tipo
RENAME CONSTRAINT fk_tipo
TO pk_tipo;
--