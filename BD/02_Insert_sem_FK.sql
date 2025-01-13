
INSERT INTO Status_Base (status_base_id, vida, atk, def, velocidade)
VALUES 

(1, 45, 49, 49, 45), -- Bulbasaur  
(2, 60, 62, 63, 60), -- Ivysaur  
(3, 80, 82, 83, 80), -- Venusaur  

(4, 39, 52, 43, 65), -- Charmander  
(5, 58, 64, 58, 58), -- Charmeleon  
(6, 78, 84, 78, 78), -- Charizard  

(7, 44, 48, 65, 45), -- Squirtle  
(8, 59, 63, 80, 30), -- Wartortle  
(9, 79, 83, 100, 70), -- Blastoise  

(10, 45, 30, 35, 75), -- Caterpie  
(11, 50, 20, 55, 30), -- Metapod  
(12, 60, 45, 50, 70), -- Butterfree  

(13, 40, 35, 30, 50), -- Weedle  
(14, 45, 25, 50, 35), -- Kakuna  
(15, 65, 80, 40, 75), -- Beedrill  

(16, 40, 45, 40, 56), -- Pidgey  
(17, 63, 60, 55, 71), -- Pidgeotto  
(18, 83, 80, 75, 91), -- Pidgeot  

(19, 30, 56, 35, 72), -- Rattata  
(20, 55, 81, 60, 97), -- Raticate  

(21, 40, 60, 30, 70), -- Spearow  
(22, 65, 90, 65, 100), -- Fearow  

(23, 35, 60, 44, 55), -- Ekans  
(24, 60, 85, 69, 80), -- Arbok  

(25, 35, 55, 30, 90), -- Pikachu  
(26, 60, 90, 55, 100), -- Raichu  

(27, 50, 75, 85, 40), -- Sandshrew  
(28, 75, 100, 110, 65), -- Sandslash  

(29, 55, 47, 52, 41), -- Nidoran♀  
(30, 70, 62, 67, 56), -- Nidorina  
(31, 90, 82, 87, 76), -- Nidoqueen  

(32, 46, 57, 40, 50), -- Nidoran♂  
(33, 61, 72, 57, 65), -- Nidorino  
(34, 81, 92, 77, 85), -- Nidoking  

(35, 70, 45, 48, 35), -- Clefairy  
(36, 95, 70, 73, 60), -- Clefable  

(37, 38, 41, 40, 65), -- Vulpix  
(38, 73, 76, 75, 100), -- Ninetales  
(39, 115, 45, 20, 20), -- Jigglypuff  

(40, 140, 70, 45, 45), -- Wigglytuff  
(41, 40, 45, 35, 55), -- Zubat  
(42, 75, 80, 70, 75), -- Golbat  

(43, 45, 50, 55, 30), -- Oddish  
(44, 60, 65, 70, 45), -- Gloom  
(45, 70, 65, 60, 90), -- Vileplume  

(46, 10, 55, 25, 95), -- Paras  
(47, 35, 80, 50, 120), -- Parasect  
(48, 40, 45, 35, 90), -- Venonat  

(49, 65, 70, 60, 115), -- Venomoth  
(50, 50, 52, 48, 55), -- Diglett  
(51, 80, 82, 78, 85), -- Dugtrio  

(52, 40, 80, 35, 70), -- Meowth  
(53, 65, 105, 60, 95), -- Persian  
(54, 55, 70, 45, 60), -- Psyduck  

(55, 90, 110, 80, 95), -- Golduck  
(56, 40, 50, 40, 90), -- Mankey  
(57, 65, 65, 65, 90), -- Primeape  

(58, 90, 85, 95, 70), -- Growlithe  
(59, 25, 20, 15, 90), -- Arcanine  
(60, 40, 35, 30, 50), -- Poliwag  

(61, 65, 	65, 	65, 90), -- Poliwhirl  
(62, 90, 	85, 	95, 70), -- Poliwrath 

(63, 25, 	20, 	15, 105), -- Abra  
(64, 55, 	50, 	45, 120), -- Kadabra 

(65, 70, 	80, 	50, 35), -- Alakazan 
(66, 80, 	100, 	70, 45), -- Machop
(67, 90, 	130, 	80, 76), -- Machoke 

(68, 90, 	130, 	80, 55), -- Machamp
(69, 30, 	35, 	30, 80), -- Gastly #092 
(70, 45, 	50, 	45, 95), -- Haunter #093

(71, 60, 	65, 	60 	, 110), -- Gengar #094  
(72, 35, 	45, 	160 	, 70), -- Onix 095

(73, 50, 	50, 	95, 65), -- cubone 104
(74, 60, 	80, 	110 	, 45), -- Marowak 105 
(75, 95, 	125, 	79,  81), -- Gyrados  130

(76, 20, 	10,	55, 15), -- Magicarp 129
(77, 130, 	85, 	80, 60), -- Lapras 131
(78,  	106, 	110, 	90, 130), -- Mewtwo 150  

(79, 100, 	100, 	100, 100), -- Mew 151
(80, 41, 	64, 	45, 50), -- Dratini 147
(81, 61, 	84, 	65, 70), -- Dragonair 148
(82, 91, 	134, 	95, 80); -- Dragonite 149




INSERT INTO Eficacia (eficacia_id, multiplicador, Nome)
VALUES 
(1, 0, 'Não efetivo'),
(2, 0.5, 'Não muito efetivo'),
(3, 1, 'efetivo'),
(4, 2, 'Super-efetivo');



INSERT INTO Golpe (golpe_id, Nome, categoria, dano, precisao, num_vezes_usar, Efeito)
VALUES 
(1, 'EmberFire', 'Especial', 40, 1.00, 25, 'Queima o oponente'),
(2, 'Fire Blast', 'Especial', 110, 0.85, 5, 'Queima o oponente'),
(3, 'Fire Punch', 'Fisico', 75, 1.00, 15, 'Queima o oponente'),
(4, 'Fire Spin', 'Especial', 35, 0.85, 15, 'Aprisiona o oponente, causando 4-5 de dano por turno'),
(5, 'Flamethrower', 'Especial', 90, 1.00, 15, 'Queima o oponente'),
(6, 'Bubble', 'Especial', 40, 1.00, 30, 'Pode reduzir a Velocidade do oponente.'),
(7, 'Bubble Beam', 'Especial', 65, 1.00, 20, 'Pode reduzir a Velocidade do oponente.'),
(8, 'Clamp', 'Fisico', 35, 0.85, 15, 'Prende o oponente, causando dano por 4-5 turnos.'),
(9, 'Crabhammer', 'Fisico', 100, 0.90, 10, 'Alta chance de golpe crítico.'),
(10, 'Hydro Pump', 'Especial', 110, 0.80, 5, NULL),
(11, 'Surf', 'Especial', 90, 1.00, 15, 'Atingiu todos os Pokémon adjacentes.'),
(12, 'Water Gun', 'Especial', 40, 1.00, 25, NULL),
(13, 'Waterfall', 'Fisico', 80, 1.00, 15, 'Pode causar tremor.'),
(14, 'Withdraw', 'Status', NULL, NULL, 40, 'Aumenta a Defesa do usuário.'),
(15, 'Thunder', 'Especial', 110, 0.70, 10, 'Pode paralisar o oponente.'),
(16, 'Thunder Punch', 'Especial', 75, 1.00, 15, 'Pode paralisar o oponente.'),
(17, 'Thunder Shock', 'Fisico', 40, 1.00, 30, 'Pode paralisar o oponente.'),
(18, 'Thunder Wave', 'Status', NULL, 0.90, 20, 'Paralisa o oponente.'),
(19, 'Thunderbolt', 'Especial', 90, 1.00, 15, 'Pode paralisar o oponente.'),
(20, 'Absorb', 'Especial', 20, 1.00, 25, 'O usuário recupera metade do HP infligido no oponente.'),
(21, 'Leech Seed', 'Status', NULL, 0.90, 10, 'Drena HP do oponente a cada turno.'),
(22, 'Mega Drain', 'Especial', 40, 1.00, 15, 'O usuário recupera metade do HP infligido no oponente.'),
(23, 'Petal Dance', 'Especial', 120, 1.00, 10, 'O usuário ataca por 2-3 turnos e então fica confuso.'),
(24, 'Razor Leaf', 'Fisico', 55, 0.95, 25, 'Alta chance de golpe crítico.'),
(25, 'Sleep Powder', 'Status', NULL, 0.75, 15, 'Coloca o oponente para dormir.'),
(26, 'Solar Beam', 'Especial', 120, 1.00, 10, 'Carrega no primeiro turno, ataca no segundo.'),
(27, 'Spore', 'Status', NULL, 1.00, 15, 'Coloca o oponente para dormir.'),
(28, 'Stun Spore', 'Status', NULL, 0.75, 30, 'Paralisa o oponente.'),
(29, 'Barrage', 'Fisico', 15, 0.85, 20, 'Acerta 2-5 vezes em um único turno.'),
(30, 'Bide', 'Fisico', NULL, NULL, 10, 'O usuário recebe dano por dois turnos e então contra-ataca com o dobro.'),
(31, 'Bind', 'Fisico', 15, 0.85, 20, 'Prende o oponente, causando dano por 4-5 turnos.'),
(32, 'Body Slam', 'Fisico', 85, 1.00, 15, 'Pode paralisar o oponente.'),
(33, 'Comet Punch', 'Fisico', 18, 0.85, 15, 'Acerta 2-5 vezes em um único turno.'),
(34, 'Constrict', 'Fisico', 10, 1.00, 35, 'Pode reduzir a Velocidade do oponente em um estágio.'),
(35, 'Conversion', 'Status', NULL, NULL, 30, 'Altera o tipo do usuário para o tipo de seu primeiro movimento.'),
(36, 'Cut', 'Fisico', 50, 0.95, 30, NULL),
(37, 'Defense Curl', 'Status', NULL, NULL, 40, 'Aumenta a Defesa do usuário.'),
(38, 'Disable', 'Status', NULL, 1.00, 20, 'O oponente não pode usar seu último ataque por alguns turnos.'),
(39, 'Dizzy Punch', 'Fisico', 70, 1.00, 10, 'Pode confundir o oponente.'),
(40, 'Double Slap', 'Fisico', 15, 0.85, 10, 'Acerta 2-5 vezes em um único turno.'),
(41, 'Double Team', 'Status', NULL, NULL, 15, 'Aumenta a Evasão do usuário.'),
(42, 'Acid', 'Especial', 40, 1.00, 30, 'Pode reduzir a Defesa Especial do oponente.'),
(43, 'Acid Armor', 'Status', NULL, NULL, 20, 'Aumenta drasticamente a Defesa do usuário.'),
(44, 'Poison Gas', 'Status', NULL, 0.90, 40, 'Envenena o oponente.'),
(45, 'Poison Powder', 'Status', NULL, 0.75, 35, 'Envenena o oponente.'),
(46, 'Poison Sting', 'Fisico', 15, 1.00, 35, 'Pode envenenar o oponente.'),
(47, 'Sludge', 'Especial', 65, 1.00, 20, 'Pode envenenar o oponente.'),
(48, 'Smog', 'Especial', 30, 0.70, 20, 'Pode envenenar o oponente.'),
(49, 'Toxic', 'Status', NULL, 0.90, 10, 'Envenena gravemente o oponente.'),
(50, 'Counter', 'Fisico', NULL, NULL, 20, 'Quando atingido por um Ataque Físico, o usuário contra-ataca com o dobro de poder.'),
(51, 'Double Kick', 'Fisico', 30, 1.00, 30, 'Acerta duas vezes em um único turno.'),
(52, 'High Jump Kick', 'Fisico', 130, 0.90, 10, 'Se errar, o usuário perde metade de seu HP.'),
(53, 'Jump Kick', 'Fisico', 100, 0.95, 10, 'Se errar, o usuário perde metade de seu HP.'),
(54, 'Karate Chop', 'Fisico', 50, 1.00, 25, 'Alta chance de golpe crítico.'),
(55, 'Low Kick', 'Fisico', NULL, 1.00, 20, 'Quanto mais pesado o oponente, mais forte o ataque.'),
(56, 'Leech Life', 'Fisico', 80, 1.00, 10, 'O usuário recupera metade do HP infligido no oponente.'),
(57, 'Pin Missile', 'Fisico', 25, 0.95, 20, 'Acerta 2-5 vezes em um único turno.'),
(58, 'String Shot', 'Status', NULL, 0.95, 40, 'Reduz drasticamente a Velocidade do oponente.'),
(59, 'Twineedle', 'Fisico', 25, 1.00, 20, 'Acerta duas vezes em um único turno. Pode envenenar o oponente.'),
(60, 'Blizzard', 'Especial', 110, 0.70, 20, 'Pode congelar o oponente');


INSERT INTO Metodo (metodo_id, nome, Nivel)
VALUES 
(1, 'Nivel', 3),
(2, 'Nivel', 5),
(3, 'Nivel', 9),
(4, 'Nivel', 13),
(5, 'Nivel', 15),
(6, 'evolucao', 16),
(7, 'evolucao', 32),
(8, 'evolucao', 36),
(9, 'evolucao', 7),
(10, 'evolucao', 10),
(11, 'evolucao', 18),
(12, 'evolucao', 20),
(13, 'evolucao', 22),
(14, 'evolucao', 21),
(15, 'evolucao', 31),
(16, 'evolucao', 24),
(17, 'evolucao', 28),
(18, 'evolucao', 26),
(19, 'evolucao', 33),
(20, 'evolucao', 25),
(21, 'evolucao', 40);


INSERT INTO Pokemon_selvagem (selvagem_id,  taxa_aparicao)
VALUES 
(1, 0),
(2, 0.25),
(3, 0.5),
(4, 0.75),
(5, 0.85);


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
(15, '#015'),
(16, '#016'),
(17, '#017'),
(18, '#018'),
(19, '#019'),
(20, '#020'),
(21, '#021'),
(22, '#022'),
(23, '#023'),
(24, '#024'),
(25, '#025'),
(26, '#026'),
(27, '#027'),
(28, '#028'),
(29, '#029'),
(30, '#030'),
(31, '#031'),
(32, '#032'),
(33, '#033'),
(34, '#034'),
(35, '#035'),
(36, '#036'),
(37, '#037'),
(38, '#038'),
(39, '#039'),
(40, '#040'),
(41, '#041'),
(42, '#042'),
(43, '#043'),
(44, '#044'),
(45, '#045'),
(46, '#046'),
(47, '#047'),
(48, '#048'),
(49, '#049'),
(50, '#050'),
(51, '#051'),
(52, '#052'),
(53, '#053'),
(54, '#054'),
(55, '#055'),
(56, '#056'),
(57, '#057'),
(58, '#058'),
(59, '#059'),
(60, '#060'),
(61, '#061'),
(62, '#062'),
(63, '#063'),
(64, '#064'),
(65, '#065'),
(66, '#066'),
(67, '#067'),
(68, '#068'),
(69, '#092'),
(70, '#093'),
(71, '#094'),
(72, '#095'),
(73, '#104'),
(74, '#105'),
(75, '#130'),
(76, '#129'),
(77, '#131'),
(78, '#150'),
(79, '#151'),
(80, '#147'),
(81, '#148'),
(82, '#149');


INSERT INTO Local_ (local_id, tipo_local, nome_local, nome_cidade)
VALUES 
(0, 'inicio', 'Centro', 'Pallet Town'),
(1, 'pokecenter', 'Pokecenter', 'Pallet Town'),
(2, 'pokemart', 'Pokemart', 'Pallet Town'),
(3, 'ginasio', 'Ginásio', 'Pallet Town'),
(4, 'rota', 'Rota1', 'Pallet Town'),
(5, 'rota', 'Rota21', 'Pallet Town'),


(6, 'rota', 'Rota2', 'Viridian City'),

(7, 'pokecenter', 'Pokecenter', 'Cinnabar Island'),
(8, 'pokemart', 'Pokemart', 'Cinnabar Island'),
(9, 'ginasio', 'Ginásio', 'Cinnabar Island'),

(10, 'pokecenter', 'Pokecenter', 'Viridian City'),
(11, 'pokemart', 'Pokemart', 'Viridian City'),
(12, 'ginasio', 'Ginásio', 'Viridian City'),

(13, 'pokecenter', 'Pokecenter', 'Pewter City'),
(14, 'pokemart', 'Pokemart', 'Pewter City'),
(15, 'ginasio', 'Ginásio', 'Pewter City'),
(16, 'rota', 'Rota22', 'Viridian City');

INSERT INTO local_leva_local (local_id_1, local_id_2)
VALUES
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,3),
(2,4),
(2,5),
(3,1),
(3,2),
(3,4),
(3,5),
(4,1),
(4,2),
(4,3),
(4,10),
(4,11),
(4,12),
(12,4),
(12,10),
(12,11),
(11,4),
(11,12),
(11,10),
(10,11),
(10,12),
(10,4),
(10,6),
(11,6),
(12,6),
(6,10),
(6,11),
(6,12),
(6,13),
(6,14),
(6,15),
(15,13),
(15,14),
(15,6),
(13,14),
(13,15),
(13,6),
(14,6),
(14,15),
(14,13),
(5,1),
(5,2),
(5,3),
(5,7),
(5,8),
(5,9),
(9,5),
(9,7),
(9,8),
(7,5),
(7,8),
(7,9),
(8,5),
(8,7),
(8,9),
(16,1),
(16,2),
(16,3);


INSERT INTO item (item_id, tipo)
VALUES 
(1, 'Medicina'), 
(2, 'Pokebola'),
(3, 'Status');


INSERT INTO Pokemon (pokemon_id, status_base, Nome, qtd_tipos, pokedex)
VALUES 
(1, 1, 'Bulbasaur',2, 1),
(2, 2, 'Ivysaur', 2, 2),
(3, 3, 'Venusaur', 2, 3),
(4, 4, 'Charmander', 1, 4),
(5, 5, 'Charmeleon', 1, 5),
(6, 6, 'Charizard', 2, 6),
(7, 7, 'Squirtle', 1, 7),
(8, 8, 'Wartortle', 1, 8),
(9, 9, 'Blastoise', 1, 9),
(10, 10, 'Caterpie', 1, 10),
(11, 11, 'Metapod', 1, 11),
(12, 12, 'Butterfree', 2, 12),
(13, 13, 'Weedle', 2, 13),
(14, 14, 'Kakuna', 2, 14),
(15, 15, 'Beedrill', 2, 15),
(16, 16, 'Pidgey', 2, 16),
(17, 17, 'Pidgeotto', 2, 17),
(18, 18, 'Pidgeot', 2, 18),
(19, 19, 'Rattata', 1, 19),
(20, 20, 'Raticate', 1, 20),
(21, 21, 'Spearow', 2, 21),
(22, 22, 'Fearow', 2, 22),
(23, 23, 'Ekans', 1, 23),
(24, 24, 'Arbok', 1, 24),
(25, 25, 'Pikachu', 1, 25),
(26, 26, 'Raichu', 1, 26),
(27, 27, 'Sandshrew', 1, 27),
(28, 28, 'Sandslash', 1, 28),
(29, 29, 'Nidoran♀', 1, 29),
(30, 30, 'Nidorina', 1, 30),
(31, 31, 'Nidoqueen', 2, 31),
(32, 32, 'Nidoran♂', 1, 32),
(33, 33, 'Nidorino', 1, 33),
(34, 34, 'Nidoking', 2, 34),
(35, 35, 'Clefairy', 1, 35),
(36, 36, 'Clefable', 1, 36),
(37, 37, 'Vulpix', 1, 37),
(38, 38, 'Ninetales', 1, 38),
(39, 39, 'Jigglypuff', 1, 39),
(40, 40, 'Wigglytuff', 1, 40),
(41, 41, 'Zubat', 2, 41),
(42, 42, 'Golbat', 2, 42),
(43, 43, 'Oddish', 2, 43),
(44, 44, 'Gloom', 2, 44),
(45, 45, 'Vileplume', 2, 45),
(46, 46, 'Paras', 2, 46),
(47, 47, 'Parasect', 2, 47),
(48, 48, 'Venonat', 2, 48),
(49, 49, 'Venomoth', 2, 49),
(50, 50, 'Diglett', 1, 50),
(51, 51, 'Dugtrio', 1, 51),
(52, 52, 'Meowth', 1, 52),
(53, 53, 'Persian', 1, 53),
(54, 54, 'Psyduck', 1, 54),
(55, 55, 'Golduck', 1, 55),
(56, 56, 'Mankey', 1, 56),
(57, 57, 'Primeape', 1, 57),
(58, 58, 'Growlithe', 1, 58),
(59, 59, 'Arcanine', 1, 59),
(60, 60, 'Poliwag', 1, 60),
(61, 61, 'Poliwhirl', 1, 61),
(62, 62, 'Poliwrath', 2, 62),
(63, 63, 'Abra', 1, 63),
(64, 64, 'Kadabra', 1, 64),
(65, 65, 'Alakazam', 1, 65),
(66, 66, 'Machop', 1, 66),
(67, 67, 'Machoke', 1, 67),
(68, 68, 'Machamp', 1, 68),
(69, 69, 'Gastly', 2, 69),
(70, 70, 'Haunter', 2, 70),
(71, 71, 'Gengar', 2, 71),
(72, 72, 'Onix', 2, 72),
(73, 73, 'Cubone', 1, 73),
(74, 74, 'Marowak', 1, 74),
(75, 75, 'Gyarados', 2, 75),
(76, 76, 'Magikarp', 1, 76),
(77, 77, 'Lapras', 2, 77),
(78, 78, 'Mew', 1, 78),
(79, 79, 'Mewtwo', 1, 79),
(80, 80, 'Dratini', 1, 80),
(81, 81, 'Dragonair', 1, 81),
(82, 82, 'Dragonite', 2, 82);


INSERT INTO Tipo (tipo_id, Nome)
VALUES 
(1,  'Normal'),
(2,  'Fogo'),
(3,  'Água'),
(4,  'Eletrico'),
(5,  'Folha'),
(6,  'Gelo'),
(7,  'Lutador'),
(8,  'Veneno'),
(9,  'Terra'),
(10,  'Voador'),
(11,  'Pisiquico'),
(12,  'Inseto'),
(13,  'Pedra'),
(14,  'Fantasma'),
(15,  'Dragão');

INSERT INTO golpe_tipo(tipo_id, golpe_id)
VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(5, 26),
(5, 27),
(5, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 53),
(7, 54),
(7, 55),
(12, 56),
(12, 57),
(12, 58),
(12, 59),
(6, 60);

INSERT INTO Pokemon_tipo(tipo_id, pokemon_id)
VALUES
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 39),
(1, 40),
(2, 4),
(2, 5),
(2, 6),
(2, 37),
(2, 38),
(2, 58),
(2, 59),
(3, 7),
(3, 8),
(3, 9),
(3, 54),
(3, 55),
(3, 60),
(3, 61),
(3, 62),
(3, 76),
(3, 75),
(3, 77),
(4, 25),
(4, 26),
(5, 1),
(5, 2),
(5, 3),
(5, 43),
(5, 44),
(5, 45),
(5, 46),
(5, 47),
(6, 77),
(7, 56),
(7, 57),
(7, 62),
(7, 66),
(7, 67),
(7, 68),
(8, 1),
(8, 2),
(8, 3),
(8, 13),
(8, 14),
(8, 15),
(8, 23),
(8, 24),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 48),
(8, 49),
(8, 69),
(8, 70),
(8, 71),
(9, 50),
(9, 51),
(9, 27),
(9, 28),
(9, 73),
(9, 74),
(9, 72),
(10, 6),
(10, 12),
(10, 82),
(10, 75),
(10, 41),
(10, 42),
(10, 21),
(10, 22),
(10, 16),
(10, 17),
(10, 18),
(11, 78),
(11, 79),
(11, 63),
(11, 64),
(11, 65),
(12, 10),
(12, 11),
(12, 12),
(12, 13),
(12, 14),
(12, 15),
(12, 46),
(12, 47),
(12, 48),
(12, 49),
(13, 72),
(14, 69),
(14, 70),
(14, 71),
(15, 80),
(15, 81),
(15, 82);

INSERT INTO evolucao_pokemon(pokemon_id_1, pokemon_id_2, nivel_min)
VALUES
(1, 2, 16),
(2, 3, 32),
(4, 5, 16),
(5, 6, 36),
(7, 8, 16),
(8, 9, 36),
(10, 11, 7),
(11, 12, 10),
(13, 14, 7),
(14, 15, 10),
(16, 17, 18),
(17, 18, 36),
(19, 20, 20),
(21, 22, 20),
(23, 24, 22),
(25, 26, 20),
(27, 28, 22),
(29, 30, 16),
(30, 31, 22),
(32, 33, 16),
(33, 34, 22),
(35, 36, 16),
(37, 38, 22),
(39, 40, 22),
(41, 42, 22),
(43, 44, 21),
(44, 45, 36),
(46, 47, 24),
(48, 49, 31),
(50, 51, 26),
(52, 53, 28),
(54, 55, 33),
(56, 57, 28),
(58, 59, 22),
(60, 61, 25),
(61, 62, 32),
(63, 64, 16),
(64, 65, 24),
(66, 67, 28),
(67, 68, 36),
(68, 69, 25),
(69, 70, 32),
(72, 73, 28),
(76, 75, 20),
(80, 81, 30),
(81, 82, 40);

INSERT INTO upar_pokemon (pokemon_id, exp_necessaria)
VALUES 
(1, 64),
(2, 142),
(3, 236),
(4, 62),
(5, 142),
(6, 267),
(7, 63),
(8, 142),
(9, 239),
(10, 39),
(11, 72),
(12, 178),
(13, 39),
(14, 205),
(15, 178),
(16, 50),
(17, 122),
(18, 216),
(19, 51),
(20, 145),
(21, 52),
(22, 155),
(23, 58),
(24, 157),
(25, 112),
(26, 112),
(27, 60),
(28, 158),
(29, 55),
(30, 128),
(31, 227),
(32, 55),
(33, 128),
(34, 227),
(35, 113),
(36, 217),
(37, 60),
(38, 177),
(39, 95),
(40, 218),
(41, 49),
(42, 159),
(43, 64),
(44, 138),
(45, 221),
(46, 57),
(47, 142),
(48, 61),
(49, 158),
(50, 53),
(51, 149),
(52, 58),
(53, 149),
(54, 64),
(55, 175),
(56, 61),
(57, 159),
(58, 70),
(59, 194),
(60, 60),
(61, 135),
(62, 230),
(63, 62),
(64, 140),
(65, 225),
(66, 61),
(67, 142),
(68, 227),
(69, 62),
(70, 142),
(71, 250),
(72, 77),
(73, 64),
(74, 149),
(75, 189),
(76, 40),
(77, 187),
(78, 340),
(79, 300),
(80, 60),
(81, 147),
(82, 300);

INSERT INTO eficacia_tipo (tipo_id, tipo_id2, eficacia_id)
VALUES 
(1, 1, 3),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(1, 5, 3),
(1, 6, 3),
(1, 7, 3),
(1, 8, 3),
(1, 9, 3),
(1, 10, 3),
(1, 11, 3),
(1, 12, 3),
(1, 13, 2),
(1, 14, 1),
(1, 15, 3),
(2, 2, 2),
(2, 3, 2),
(2, 4, 1),
(2, 5, 4),
(2, 6, 4),
(2, 7, 3),
(2, 8, 3),
(2, 9, 3),
(2, 10, 3),
(2, 11, 3),
(2, 12, 4),
(2, 13, 2),
(2, 14, 3),
(2, 15, 2),
(3, 2, 4),
(3, 3, 2),
(3, 4, 3),
(3, 5, 2),
(3, 6, 3),
(3, 7, 3),
(3, 8, 3),
(3, 9, 3),
(3, 10, 3),
(3, 11, 3),
(3, 12, 4),
(3, 13, 2),
(3, 14, 3),
(3, 15, 2),
(4, 3, 4),
(4, 4, 2),
(4, 5, 2),
(4, 6, 3),
(4, 7, 3),
(4, 8, 3),
(4, 9, 1),
(4, 10, 4),
(4, 11, 3),
(4, 12, 3),
(4, 13, 3),
(4, 14, 3),
(4, 15, 2),
(5, 2, 2),
(5, 3, 4),
(5, 5, 2),
(5, 6, 3),
(5, 7, 3),
(5, 8, 2),
(5, 9, 4),
(5, 10, 2),
(5, 11, 3),
(5, 12, 2),
(5, 13, 4),
(5, 14, 3),
(5, 15, 2),
(6, 2, 2),
(6, 3, 2),
(6, 5, 4),
(6, 6, 2),
(6, 7, 3),
(6, 8, 3),
(6, 9, 3),
(6, 10, 4),
(6, 11, 4),
(6, 12, 3),
(6, 13, 3),
(6, 14, 3),
(6, 15, 4),
(7, 1, 4),
(7, 6, 4),
(7, 7, 3),
(7, 8, 2),
(7, 9, 3),
(7, 10, 2),
(7, 11, 2),
(7, 12, 2),
(7, 13, 4),
(7, 14, 1),
(7, 15, 3),
(8, 4, 4),
(8, 8, 2),
(8, 9, 2),
(8, 10, 3),
(8, 11, 3),
(8, 12, 3),
(8, 13, 2),
(8, 14, 2),
(8, 15, 3),
(9, 2, 4),
(9, 4, 4),
(9, 5, 2),
(9, 8, 4),
(9, 9, 3),
(9, 10, 1),
(9, 11, 3),
(9, 12, 2),
(9, 13, 4),
(9, 14, 3),
(9, 15, 3),
(10, 3, 2),
(10, 4, 4),
(10, 6, 4),
(10, 10, 3),
(10, 11, 3),
(10, 12, 4),
(10, 13, 2),
(10, 14, 3),
(10, 15, 3),
(11, 11, 2),
(11, 12, 3),
(11, 13, 3),
(11, 14, 3),
(11, 15, 3),
(12, 12, 3),
(12, 13, 3),
(12, 14, 2),
(12, 15, 3),
(13, 13, 3),
(13, 14, 3),
(13, 15, 3),
(14, 14, 4),
(14, 15, 3),
(15, 15, 3);

INSERT INTO Mochila(mochila_id, pokedex_id, qtd_itens, item)
VALUES
(1,1,0,1),
(2,1,0,1),
(3,1,10,1);

INSERT INTO Pokecenter(pokecenter_id, time, local_id, qtd_npcs)
VALUES
(1,0,1,2),

INSERT INTO Caminho(caminho_id, qtd_itens, local_id)
VALUES
(1, 2, 0);

INSERT INTO Zona_de_captura(zona_captura_id, chance_surgimento, local_id)
VALUES
(1, 1, 4);

INSERT INTO Pokemart(pokemart_id, qtd_npcs, local_id)
VALUES
(1, 2, 0);


INSERT INTO Pokebola(pokebola_id, item_id, nome, taxa_cura, descricao)
VALUES
(1, 2, 'Poké Ball', 0, 'Captura pokemon selvagem'),
(2, 2, 'Ultra Ball', 0, 'Captura pokemon selvagem 2x mais chance que a Poké Ball');

INSERT INTO Time_Principal (time_princ_id, ordem)
VALUES
(0, 1 );

INSERT INTO Time (time_id, time_principal, qtd_pokemons)
VALUES
(1,NULL,0),
(2,NULL,0);

INSERT INTO Inst_Pokemon(inst_pokemon, pokedex, time, experiencia, vida_atual)
VALUES
(1, 1, 1, 0, 100);
(4, 4, 1, 0, 100);

INSERT INTO integra_ao_time(inst_pokemon_id, time)
VALUES
(1, 1);

INSERT INTO Treinador (treinador_id, time, mochila, local_id, tipo_treinador)
VALUES
(1,1,1,0,'player'),
(2,2,2,3,'Lider Brock'),
(3,NULL,NULL,0,'Professor');

INSERT INTO Pc (player_id, treinador_id, nome, num_insigneas)
VALUES
(1,1,'mauricio',0);

INSERT INTO lider(lider_id, treinador_id, nome, insignea, status)
VALUES
(1, 2, 'Brock', 'Rocha', 'Ativo');

INSERT INTO NPC(npc_id, treinador_id, nome, nivel_dificuldade, falas)
VALUES
(1, 2, 'Professor Carvalho', 0, 'Seja bem vindo a Pallet Town!');

INSERT INTO Utilitario(pocao_id, item_id, nome, taxa_cura, descricao)
VALUES
(0, 1, 'Potion', 0.2, 'Cura 20% da vida do Pokemon');

INSERT INTO Aprende_golpe_metodo(metodo_id, golpe_id)
VALUES
(1, 29),
(3, 5),
(6, 8);

INSERT INTO golpe_eficacia(eficacia_id, golpe_id)
VALUES
(3, 29),
(3, 5),
(2, 8);

INSERT INTO Pokemon_golpe(pokemon_id, golpe_id)
VALUES
(1, 21),
(1, 24),
(1, 45),
(2, 26),
(2, 25),
(2, 28);

INSERT INTO Inst_item(Inst_item_id, quantidade, mochila, item)
VALUES
(1, 5, 1, 2),
(2, 2, 1, 1);

INSERT INTO Negocia(pokemart_id, inst_item_id, preco)
VALUES
(1, 1, 5),
(1, 2, 3);

INSERT INTO Surge(zona_captura_id, selvagem_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

INSERT INTO caminho_item(caminho_id, inst_item_id)
VALUES
(1, 1),
(1, 2),

INSERT INTO local_leva_local(local_id_1, local_id_2)
VALUES
(0, 1),
(1, 0),
(0, 2),
(2, 0),
(0, 3),
(3, 0),
(4, 0),
(0, 4);

INSERT INTO Possui(inst_pokemon_id, pokemon_id)
VALUES
(1, 1),
(4, 4);

INSERT INTO Encontra(selvagem_id, treinador_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

INSERT INTO Captura(selvagem_id, treinador_id, chance_atual)
VALUES
(1, 1, 0.5),
(4, 1, 0.2);

INSERT INTO Torna(selvagem_id, treinador_id)
VALUES
(1, 1),
(4, 4);

INSERT INTO Batalha(batalha_id, treinador_id_1, treinador_id_2, resultado, recompensa)
VALUES
(1, 1, 2, 'Vitória', 'Parabéns voce recebeu a insignea da rocha'),


INSERT INTO treinador_interacao(treinador_id_1, treinador_id_2)
VALUES
(1, 2),
(1, 3);

INSERT INTO Ginasio(ginasio_id, lider, nome, local_id)
VALUES
(1, 1, 'Ginásio de Pallet', 3);
