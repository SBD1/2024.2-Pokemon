
INSERT INTO Status_Base (status_base_id, vida, atk, def, velocidade)
VALUES 
(1, 45, 49, 49, 45),-- Bulbassaur
(2, 60, 62, 63, 60),-- Ivysaur
(3, 80, 82, 83, 80),-- Venusaur

(4, 39, 52,	43, 65),-- Charmander
(5, 58, 64, 58, 58),-- Charmeleon
(6, 78, 84, 78, 78),-- Charizard

(7, 44, 48, 65, 45), -- Squirtle  
(8, 59, 63, 80, 30), -- Wartortle  
(9, 79, 83, 100, 70), -- Blastoise  

(10, 45, 30, 35, 75), -- Caterpie  
(11, 50, 20, 55, 30), -- Metapod  
(12, 60, 45, 50, 70), -- Butterfree  

(13, 40, 35, 30, 50), -- Weedle  
(14, 45, 25, 50, 35), -- Kakuna  
(15, 65, 80, 40, 75); -- Beedrill 

--ALTER TABLE Eficacia
--ADD Nome varchar(20)

INSERT INTO Eficacia (eficacia_id, multiplicador, Nome)
VALUES 
(1, 0, 'No Effect'),
(2, 0.5, 'Not very effective'),
(3, 1, 'Normal'),
(4, 2, 'Super-effective');

--ALTER TABLE Golpe
--ADD Efeito varchar(50) NOT NULL;

--ALTER TABLE Golpe
--ALTER COLUMN Efeito TYPE VARCHAR(250);

INSERT INTO Golpe (golpe_id, Nome, categoria, dano, precisao, num_vezes_usar, Efeito)
VALUES 
(01, 'EmberFire', 'Especial', 40, 100, 25, 'Queima o oponente'),
(02, 'Fire Blast', 'Especial', 110, 85, 5, 'Queima o oponente'),
(03, 'Fire Punch', 'Fisico', 75, 100, 15, 'Queima o oponente'),
(04, 'Fire Spin', 'Especial', 35, 85, 15, 'Aprisiona o oponente, causando 4-5 de dano por turno'),
(05, 'Flamethrower', 'Especial', 90, 100, 15, 'Queima o oponente'),
(15, 'Bubble', 'Especial', 40, 100, 30, 'Pode reduzir a Velocidade do oponente.'),
(16, 'Bubble Beam', 'Especial', 65, 100, 20, 'Pode reduzir a Velocidade do oponente.'),
(17, 'Clamp', 'Fisico', 35, 85, 15, 'Prende o oponente, causando dano por 4-5 turnos.'),
(18, 'Crabhammer', 'Fisico', 100, 90, 10, 'Alta chance de golpe crítico.'),
(19, 'Hydro Pump', 'Especial', 110, 80, 5, NULL),
(20, 'Surf', 'Especial', 90, 100, 15, 'Atingiu todos os Pokémon adjacentes.'),
(21, 'Water Gun', 'Especial', 40, 100, 25, NULL),
(22, 'Waterfall', 'Fisico', 80, 100, 15, 'Pode causar tremor.'),
(23, 'Withdraw', 'Status', NULL, NULL, 40, 'Aumenta a Defesa do usuário.'),
(24, 'Thunder', 'Especial', 110, 70, 10, 'Pode paralisar o oponente.'),
(25, 'Thunder Punch', 'Especial', 75, 100, 15, 'Pode paralisar o oponente.'),
(26, 'Thunder Shock', 'Fisico', 40, 100, 30, 'Pode paralisar o oponente.'),
(27, 'Thunder Wave', 'Status', NULL, 90, 20, 'Paralisa o oponente.'),
(28, 'Thunderbolt', 'Especial', 90, 100, 15, 'Pode paralisar o oponente.'),
(29, 'Absorb', 'Especial', 20, 100, 25, 'O usuário recupera metade do HP infligido no oponente.'),
(30, 'Leech Seed', 'Status', NULL, 90, 10, 'Drena HP do oponente a cada turno.'),
(31, 'Mega Drain', 'Especial', 40, 100, 15, 'O usuário recupera metade do HP infligido no oponente.'),
(32, 'Petal Dance', 'Especial', 120, 100, 10, 'O usuário ataca por 2-3 turnos e então fica confuso.'),
(33, 'Razor Leaf', 'Fisico', 55, 95, 25, 'Alta chance de golpe crítico.'),
(34, 'Sleep Powder', 'Status', NULL, 75, 15, 'Coloca o oponente para dormir.'),
(35, 'Solar Beam', 'Especial', 120, 100, 10, 'Carrega no primeiro turno, ataca no segundo.'),
(36, 'Spore', 'Status', NULL, 100, 15, 'Coloca o oponente para dormir.'),
(37, 'Stun Spore', 'Status', NULL, 75, 30, 'Paralisa o oponente.');


INSERT INTO Metodo (metodo_id, nome, Nivel)
VALUES 
(1, 'Nivel', 3),
(2, 'Nivel', 5),
(3, 'Nivel', 9),
(4, 'Nivel', 13),
(5, 'Nivel', 15);


INSERT INTO Metodo (metodo_id, nome, Nivel)
VALUES 
(21, 'evolucao', 16),
(22, 'evolucao', 32),
(23, 'evolucao', 36),
(24, 'evolucao', 7),
(25, 'evolucao', 10);

--ALTER TABLE Pokemon_selvagem
--DROP COLUMN nivel_min,
--DROP COLUMN nivel_max;

INSERT INTO Pokemon_selvagem (selvagem_id, taxa_aparicao)
VALUES 
(1, 0),
(2, 0.25),
(3, 0.5),
(4, 0.75);

--ALTER TABLE Pokedex
--ALTER COLUMN num_pokedex TYPE VARCHAR(20);

INSERT INTO Pokedex (pokedex_id, num_pokedex)
VALUES 
(1, '#001'),
(2, '#002'),
(3, '#003'),
(4, '#004'),
(5, '#005'),
(6, '#006'),
(7, '#007'),
(8, '#008'),
(9, '#009'),
(10, '#010'),
(11, '#011'),
(12, '#012'),
(13, '#013'),
(14, '#014'),
(15, '#015');

INSERT INTO Local_ (local_id, tipo_local, nome_local, nome_cidade)
VALUES 
(1, 'cidade', 'Pokecenter', 'Pallet Town' ),
(2, 'cidade', 'Pokemart', 'Pallet Town' ),
(3, 'cidade', 'Ginásio', 'Pallet Town'),
(4, 'rota', 'Rota1', 'Pallet Town');

INSERT INTO item (item_id, tipo)
VALUES 
(1, 'Cura'),
(2, 'Pokebola'),
(3, 'Status');


