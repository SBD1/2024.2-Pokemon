
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
(01, 'Absorb', 'Especial', 20, 1, 25, 'O usuário recupera metade do HP infligido no oponente'),
(02, 'Acid Armor', 'Status', 0, 0, 30, 'Aumenta drasticamente a velocidade do usuário'),
(03, 'Barrage', 'fisico', 15, 0.85, 20, 'Acerta 2-5 vezes em um único turno');

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

INSERT INTO Local_ (local_id, tipo_local, nome_local, regiao)
VALUES 
(1, 'cidade', 'Pokecenter', 'Kanto'),
(2, 'cidade', 'Pokemart', 'Kanto'),
(3, 'cidade', 'Ginásio', 'Kanto'),
(4, 'rota', 'Rota1', 'Kanto');

INSERT INTO item (item_id, tipo)
VALUES 
(1, 'Cura'),
(2, 'Pokebola'),
(3, 'Status');


