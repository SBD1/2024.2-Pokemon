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

-- Consultar status de local pelo tipo e id

SELECT * FROM $tipo t
WHERE t.$tipo_id = $1;

-- Listar possiveis rotas a partir do id do player

SELECT l.local_id, l.tipo_local, l.nome_local, l.nome_cidade FROM local_ l
JOIN (SELECT local_id_2 FROM local_leva_local lll
JOIN (SELECT t.local_id FROM (SELECT * FROM pc WHERE player_id = $1) p 
JOIN treinador t ON 
t.treinador_id = p.treinador_id) pt ON
lll.local_id_1 = pt.local_id) ptl ON 
ptl.local_id_2 = l.local_id;

-- Listar pokemons do player a partir do id do memso

SELECT pk.pokemon_id, pk.status_base, pk.nome, pk.qtd_tipos, pk.pokedex FROM pokemon pk
JOIN (SELECT pokedex FROM inst_pokemon ip 
JOIN (SELECT inst_pokemon FROM time_principal tmp 
JOIN (SELECT time_principal FROM time tm
JOIN (SELECT * FROM treinador t
JOIN (SELECT treinador_id FROM pc WHERE player_id = $1) p
ON t.treinador_id = p.treinador_id) tp
ON tp.time = tm.time_id) tpm
ON tpm.time_principal = tmp.time_princ_id) ipt
ON ip.inst_pokemon = ipt.inst_pokemon) pki
ON pk.pokedex = pki.pokedex;

