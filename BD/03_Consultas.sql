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



