-- Consulta de status base pelo nome

SELECT *
FROM status_base b
INNER JOIN pokemon p
ON b.status_base_id = p.status_base AND p.nome = '$1';

-- Consulta de status base

SELECT *
FROM status_base
WHERE status_base_id = $1;

-- Consultar tipo pokemon

SELECT nome FROM tipo t
JOIN (SELECT tipo_id FROM pokemon_tipo pt 
WHERE pt.pokemon_id = $1) p
ON t.tipo_id = p.tipo_id ;

-- Consultar eficacia tipo em batalha

SELECT multiplicador, nome FROM eficacia e 
JOIN (SELECT * FROM eficacia_tipo et WHERE et.tipo_id = $1 AND et.tipo_id2 = $2) t
ON e.eficacia_id = t.eficacia_id;

-- Consultar pokemon pelo nome

SELECT * FROM pokemon p
WHERE p.nome = '$1';

-- Consultar tipo de ataque pelo nome do ataque

SELECT t.tipo_id, nome 
FROM tipo t
JOIN (SELECT tipo_id 
FROM golpe_tipo gt
JOIN (SELECT * 
FROM golpe g
WHERE g.nome = '$1') gn
ON gt.golpe_id = gn.golpe_id) tg
ON tg.tipo_id = t.tipo_id;

-- Listar possiveis ataques de um pokemon

SELECT g.golpe_id, g.nome, g.categoria, g.dano, g.precisao, g.num_vezes_usar, g.efeito FROM golpe g
JOIN (SELECT golpe_id FROM golpe_tipo gt 
JOIN (SELECT t.nome, t.tipo_id  FROM tipo t
JOIN (SELECT tipo_id FROM pokemon_tipo pt 
WHERE pt.pokemon_id = $1) p
ON t.tipo_id = p.tipo_id) ti
ON ti.tipo_id = gt.tipo_id) gti
ON gti.golpe_id = g.golpe_id ;

-- Consultar possiveis destinos de uma rota

SELECT local_id_2 FROM local_leva_local l
WHERE l.local_id_1 = $1;

-- Consultar quantidade de locais

SELECT count(*) FROM local_;

-- Consultar tipo do local pelo id

SELECT tipo_local FROM local_ l
WHERE l.local_id = $1;

-- Listar possiveis rotas a partir do id do player

SELECT l.local_id, l.tipo_local, l.nome_local, l.nome_cidade FROM local_ l
JOIN (SELECT local_id_2 FROM local_leva_local lll
JOIN (SELECT t.local_id FROM (SELECT * FROM pc WHERE player_id = $1) p 
JOIN treinador t ON 
t.treinador_id = p.treinador_id) pt ON
lll.local_id_1 = pt.local_id) ptl ON 
ptl.local_id_2 = l.local_id;

-- Listar pokemons do player a partir do id do mesmo

SELECT pm.nome, pm.status_base, pm.qtd_tipos FROM pokemon pm
JOIN (SELECT * FROM inst_pokemon ip
JOIN (SELECT * FROM pc p
JOIN treinador t
ON t.treinador_id = p.treinador_id AND p.player_id = $1) pt
ON ip."time" = pt."time") ipt
ON pm.pokemon_id = ipt.pokedex;

-- Listar lider de um ginasio e seus pokemons

SELECT p.nome, gip.nome, gip.insignea, gip.vida_atual FROM pokemon p
JOIN (SELECT * FROM inst_pokemon ip 
JOIN (SELECT * FROM time tm
JOIN (SELECT gl.nome, gl.insignea, t.time FROM treinador t
JOIN (SELECT g.lider, l.nome, l.insignea, l.treinador_id FROM ginasio g
JOIN lider l
ON g.lider = l.lider_id AND g.ginasio_id = $1) gl
ON gl.treinador_id = t.treinador_id) glt
ON tm.time_id = glt."time") gtm
ON ip."time" = gtm."time") gip
ON p.pokemon_id = gip.pokedex;


-- Consultas relacionadas a Pokémon
-- Listar todos os pokémons com seus tipos e status base
SELECT p.Nome as Pokemon, t.Nome as Tipo,
       s.vida, s.atk, s.def, s.velocidade
FROM Pokemon p
JOIN pokemon_tipo pt ON p.pokemon_id = pt.pokemon_id
JOIN Tipo t ON t.tipo_id = pt.tipo_id
JOIN Status_base s ON p.status_base = s.status_base_id
ORDER BY p.Nome;

-- Encontrar pokémons com mais de um tipo
SELECT p.Nome, COUNT(t.tipo_id) as Quantidade_Tipos,
       STRING_AGG(t.Nome, ', ') as Tipos
FROM Pokemon p
JOIN pokemon_tipo pt ON p.pokemon_id = pt.pokemon_id
JOIN Tipo t ON t.tipo_id = pt.tipo_id
GROUP BY p.Nome
HAVING COUNT(t.tipo_id) > 1;

-- Consultas relacionadas a Batalhas
-- Histórico de batalhas de um treinador específico
SELECT b.batalha_id,
       t1.tipo_treinador as Treinador1,
       t2.tipo_treinador as Treinador2,
       b.resultado,
       b.recompensa
FROM batalha b
JOIN treinador t1 ON b.treinador_id_1 = t1.treinador_id
JOIN treinador t2 ON b.treinador_id_2 = t2.treinador_id;

-- Consultas relacionadas a Ginásios e Líderes
-- Listar todos os ginásios com seus respectivos líderes e insígnias
SELECT g.nome as Ginasio,
       l.nome as Lider,
       l.insignea,
       loc.nome_cidade
FROM Ginasio g
JOIN lider l ON g.lider = l.lider_id
JOIN Local_ loc ON g.local_id = loc.local_id;

-- Consultas relacionadas a Pokémon Selvagens
-- Listar áreas de spawn de pokémon selvagens com suas chances
SELECT l.nome_local,
       l.nome_cidade,
       zc.chance_surgimento
FROM Local_ l
JOIN Zona_de_captura zc ON l.local_id = zc.local_id
WHERE zc.chance_surgimento > 0
ORDER BY zc.chance_surgimento DESC;

-- Consultas relacionadas a Times de Treinadores
-- Listar composição do time principal de um treinador
SELECT pc.nome as Treinador,
       ip.experiencia,
       p.Nome as Pokemon,
       ip.vida_atual,
       ip.status
FROM PC pc
JOIN treinador t ON pc.treinador_id = t.treinador_id
JOIN Time tm ON t.time = tm.time_id
JOIN Time_Principal tp ON tm.time_principal = tp.time_princ_id
JOIN Inst_Pokemon ip ON ip.time = tm.time_id
JOIN possui pos ON ip.inst_pokemon = pos.inst_pokemon_id
JOIN Pokemon p ON pos.pokemon_id = p.pokemon_id;

-- Consultas relacionadas a Golpes
-- Listar todos os golpes de um tipo específico com suas características
SELECT g.nome as Golpe,
       g.categoria,
       g.dano,
       g.precisao,
       g.efeito
FROM Golpe g
JOIN golpe_tipo gt ON g.golpe_id = gt.golpe_id
JOIN Tipo t ON gt.tipo_id = t.tipo_id
WHERE t.Nome = 'Fogo' -- Pode ser alterado para qualquer tipo
ORDER BY g.dano DESC;

-- Consultas relacionadas a Evolução
-- Listar cadeias de evolução dos pokémon
SELECT p1.Nome as Pokemon_Base,
       p2.Nome as Evolucao,
       ep.nivel_min as Nivel_Necessario
FROM evolucao_pokemon ep
JOIN Pokemon p1 ON ep.pokemon_id_1 = p1.pokemon_id
JOIN Pokemon p2 ON ep.pokemon_id_2 = p2.pokemon_id
ORDER BY ep.nivel_min;

-- Consultas relacionadas a NPCs
-- Listar todos os NPCs por cidade com seu nível de dificuldade
SELECT n.nome as NPC,
       n.nivel_dificuldade,
       n.falas,
       l.nome_cidade
FROM NPC n
JOIN treinador t ON n.treinador_id = t.treinador_id
JOIN Local_ l ON t.local_id = l.local_id
ORDER BY l.nome_cidade, n.nivel_dificuldade;

-- Consultas de Eficácia de Tipos
-- Listar todas as relações de eficácia entre tipos
SELECT t.Nome as Tipo,
       e.multiplicador,
       e.nome as Eficacia
FROM Tipo t
JOIN eficacia_tipo et ON t.tipo_id = et.tipo_id
JOIN Eficacia e ON et.eficacia_id = e.eficacia_id
ORDER BY t.Nome, e.multiplicador DESC;



