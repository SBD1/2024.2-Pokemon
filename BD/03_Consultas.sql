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
