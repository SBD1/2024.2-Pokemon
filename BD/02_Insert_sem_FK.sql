
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
(01, 'EmberFire', 'Especial', 40, 1.00, 25, 'Queima o oponente'),
(02, 'Fire Blast', 'Especial', 110, 0.85, 5, 'Queima o oponente'),
(03, 'Fire Punch', 'Fisico', 75, 1.00, 15, 'Queima o oponente'),
(04, 'Fire Spin', 'Especial', 35, 0.85, 15, 'Aprisiona o oponente, causando 4-5 de dano por turno'),
(05, 'Flamethrower', 'Especial', 90, 1.00, 15, 'Queima o oponente'),
(15, 'Bubble', 'Especial', 40, 1.00, 30, 'Pode reduzir a Velocidade do oponente.'),
(16, 'Bubble Beam', 'Especial', 65, 1.00, 20, 'Pode reduzir a Velocidade do oponente.'),
(17, 'Clamp', 'Fisico', 35, 0.85, 15, 'Prende o oponente, causando dano por 4-5 turnos.'),
(18, 'Crabhammer', 'Fisico', 100, 0.90, 10, 'Alta chance de golpe crítico.'),
(19, 'Hydro Pump', 'Especial', 110, 0.80, 5, NULL),
(20, 'Surf', 'Especial', 90, 1.00, 15, 'Atingiu todos os Pokémon adjacentes.'),
(21, 'Water Gun', 'Especial', 40, 1.00, 25, NULL),
(22, 'Waterfall', 'Fisico', 80, 1.00, 15, 'Pode causar tremor.'),
(23, 'Withdraw', 'Status', NULL, NULL, 40, 'Aumenta a Defesa do usuário.'),
(24, 'Thunder', 'Especial', 110, 0.70, 10, 'Pode paralisar o oponente.'),
(25, 'Thunder Punch', 'Especial', 75, 1.00, 15, 'Pode paralisar o oponente.'),
(26, 'Thunder Shock', 'Fisico', 40, 1.00, 30, 'Pode paralisar o oponente.'),
(27, 'Thunder Wave', 'Status', NULL, 0.90, 20, 'Paralisa o oponente.'),
(28, 'Thunderbolt', 'Especial', 90, 1.00, 15, 'Pode paralisar o oponente.'),
(29, 'Absorb', 'Especial', 20, 1.00, 25, 'O usuário recupera metade do HP infligido no oponente.'),
(30, 'Leech Seed', 'Status', NULL, 0.90, 10, 'Drena HP do oponente a cada turno.'),
(31, 'Mega Drain', 'Especial', 40, 1.00, 15, 'O usuário recupera metade do HP infligido no oponente.'),
(32, 'Petal Dance', 'Especial', 120, 1.00, 10, 'O usuário ataca por 2-3 turnos e então fica confuso.'),
(33, 'Razor Leaf', 'Fisico', 55, 0.95, 25, 'Alta chance de golpe crítico.'),
(34, 'Sleep Powder', 'Status', NULL, 0.75, 15, 'Coloca o oponente para dormir.'),
(35, 'Solar Beam', 'Especial', 120, 1.00, 10, 'Carrega no primeiro turno, ataca no segundo.'),
(36, 'Spore', 'Status', NULL, 1.00, 15, 'Coloca o oponente para dormir.'),
(37, 'Stun Spore', 'Status', NULL, 0.75, 30, 'Paralisa o oponente.'),
(38, 'Barrage', 'Fisico', 15, 0.85, 20, 'Acerta 2-5 vezes em um único turno.'),
(39, 'Bide', 'Fisico', NULL, NULL, 10, 'O usuário recebe dano por dois turnos e então contra-ataca com o dobro.'),
(40, 'Bind', 'Fisico', 15, 0.85, 20, 'Prende o oponente, causando dano por 4-5 turnos.'),
(41, 'Body Slam', 'Fisico', 85, 1.00, 15, 'Pode paralisar o oponente.'),
(42, 'Comet Punch', 'Fisico', 18, 0.85, 15, 'Acerta 2-5 vezes em um único turno.'),
(43, 'Constrict', 'Fisico', 10, 1.00, 35, 'Pode reduzir a Velocidade do oponente em um estágio.'),
(44, 'Conversion', 'Status', NULL, NULL, 30, 'Altera o tipo do usuário para o tipo de seu primeiro movimento.'),
(45, 'Cut', 'Fisico', 50, 0.95, 30, NULL),
(46, 'Defense Curl', 'Status', NULL, NULL, 40, 'Aumenta a Defesa do usuário.'),
(47, 'Disable', 'Status', NULL, 1.00, 20, 'O oponente não pode usar seu último ataque por alguns turnos.'),
(48, 'Dizzy Punch', 'Fisico', 70, 1.00, 10, 'Pode confundir o oponente.'),
(49, 'Double Slap', 'Fisico', 15, 0.85, 10, 'Acerta 2-5 vezes em um único turno.'),
(50, 'Double Team', 'Status', NULL, NULL, 15, 'Aumenta a Evasão do usuário.'),
(51, 'Acid', 'Especial', 40, 1.00, 30, 'Pode reduzir a Defesa Especial do oponente.'),
(52, 'Acid Armor', 'Status', NULL, NULL, 20, 'Aumenta drasticamente a Defesa do usuário.'),
(53, 'Poison Gas', 'Status', NULL, 0.90, 40, 'Envenena o oponente.'),
(54, 'Poison Powder', 'Status', NULL, 0.75, 35, 'Envenena o oponente.'),
(55, 'Poison Sting', 'Fisico', 15, 1.00, 35, 'Pode envenenar o oponente.'),
(56, 'Sludge', 'Especial', 65, 1.00, 20, 'Pode envenenar o oponente.'),
(57, 'Smog', 'Especial', 30, 0.70, 20, 'Pode envenenar o oponente.'),
(58, 'Toxic', 'Status', NULL, 0.90, 10, 'Envenena gravemente o oponente.'),
(59, 'Counter', 'Fisico', NULL, NULL, 20, 'Quando atingido por um Ataque Físico, o usuário contra-ataca com o dobro de poder.'),
(60, 'Double Kick', 'Fisico', 30, 1.00, 30, 'Acerta duas vezes em um único turno.'),
(61, 'High Jump Kick', 'Fisico', 130, 0.90, 10, 'Se errar, o usuário perde metade de seu HP.'),
(62, 'Jump Kick', 'Fisico', 100, 0.95, 10, 'Se errar, o usuário perde metade de seu HP.'),
(63, 'Karate Chop', 'Fisico', 50, 1.00, 25, 'Alta chance de golpe crítico.'),
(64, 'Low Kick', 'Fisico', NULL, 1.00, 20, 'Quanto mais pesado o oponente, mais forte o ataque.'),
(65, 'Leech Life', 'Fisico', 80, 1.00, 10, 'O usuário recupera metade do HP infligido no oponente.'),
(66, 'Pin Missile', 'Fisico', 25, 0.95, 20, 'Acerta 2-5 vezes em um único turno.'),
(67, 'String Shot', 'Status', NULL, 0.95, 40, 'Reduz drasticamente a Velocidade do oponente.'),
(68, 'Twineedle', 'Fisico', 25, 1.00, 20, 'Acerta duas vezes em um único turno. Pode envenenar o oponente.');


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
(10, 'evolucao', 10);


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
(1, 'cidade', 'Pokecenter', 'Pallet Town'),
(2, 'cidade', 'Pokemart', 'Pallet Town'),
(3, 'cidade', 'Ginásio', 'Pallet Town'),
(4, 'rota', 'Rota1', 'Pallet Town'),
(5, 'rota', 'Rota21', 'Pallet Town'),
(6, 'rota', 'Rota2', 'Viridian City'),

(7, 'cidade', 'Pokecenter', 'Cinnabar Island'),
(8, 'cidade', 'Pokemart', 'Cinnabar Island'),
(9, 'cidade', 'Ginásio', 'Cinnabar Island'),

(10, 'cidade', 'Pokecenter', 'Viridian City'),
(11, 'cidade', 'Pokemart', 'Viridian City'),
(12, 'cidade', 'Ginásio', 'Viridian City'),

(13, 'cidade', 'Pokecenter', 'Pewter City'),
(14, 'cidade', 'Pokemart', 'Pewter City'),
(15, 'cidade', 'Ginásio', 'Pewter City'),
(16, 'rota', 'Rota22', 'Viridian City');


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











