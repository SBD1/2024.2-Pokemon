
# Modelo Entidade-Relacionamento (MER) - Pokémon

## Pokémon
- **Atributos:** `pokemon_id`, `nome`, `qtd_tipos`, `experiencia`
- **Relacionamentos:**
  - Possui vários **Golpes** (N:M)
  - Evolui (**autorelacionamento 1:1**)
    - `nível_min`
  - Upa nível (**autorelacionamento 1:1**)
    - `exp_necessaria`, `nível_min`
  - Possui **Tipos** (N:M)
  - Detém **Status_Base** (1:N)

---

## Golpe
- **Atributos:** `golpe_id`, `nome`, `categoria`, `dano`, `precisao`, `num_vezes_pode_usar`
- **Relacionamentos:**
  - Interage com **Eficácia** (N:M)
  - Aprende **Método** (N:M)

---

## Tipo
- **Atributos:** `tipo_id`, `nome`
- **Relacionamentos:**
  - Possui **Eficácia** (N:M)
  - Detém **Golpe** (N:M)

---

## Método
- **Atributos:** `metodo_id`, `nome`, `nível`

---

## Status_Base
- **Atributos:** `vida`, `atk`, `def`, `velocidade`

---

## Eficácia
- **Atributos:** `eficácia_id`, `multiplicador`

---

## Treinador
- **Atributos:** `treinador_id`, `tipo_treinador`
- **Relacionamentos:**
  - Especializa em Treinador NPC, PC e Líder
  - Possui uma **Mochila** (1:1)
  - Interage com outros **Treinadores** (autorelacionamento N:M)
  - Batalha com outros **Treinadores** (autorelacionamento 1:1)
  - Encontra **Pokémons Selvagens** (N:M)
  - Captura **Pokémons Selvagens** (N:M)
  - Está em **Local** (1:N)
  - Enfrenta **NPCs** em batalhas

---

## Treinador NPC
- **Atributos:** `npc_id`, `nome`, `dificuldade`, `falas`

---

## Treinador PC
- **Atributos:** `player_id`, `num_insigneas_coletadas`, `nome`

---

## Treinador Líder
- **Atributos:** `líder_id`, `nome`, `insígnia`, `falas`, `dificuldade`

---

## Mochila
- **Atributos:** `mochila_id`, `qtd_itens`
- **Relacionamentos:**
  - Possui **Inst_Item** (N:M)
  - Pertence à **Pokedex** (1:1)

---

## Inst_Pokemon
- **Atributos:** `inst_pokemon_id`, `experiência`, `vida_atual`, `status`
- **Relacionamentos:**
  - Possui **Pokémon** (N:M)
  - Integra **Time** (1:N)

---


## Time
- **Atributos:** `time_id`, `qtd_pokemons`
- **Relacionamentos:**
  - Possui **Treinador** (1:1)
  - Compõe o **Time Principal** de um jogador

---

## Time Principal
- **Atributos:** `time_princ_id`, `ordem`
- **Relacionamentos:**
  - Compõe **Time** (1:1)
  - Está em **Ginásio**

---

## Pokémon Selvagem
- **Atributos:** `pokemon_id`, `nivel_min`, `nivel_max`, `chance_atual`, `taxa_aparicao`
- **Relacionamentos:**
  - Torna-se **Pokémon** (N:M)
  - Surge na **Zona de Captura** (N:M)

---

## Local
- **Atributos:** `local_id`, `nome`, `região`, `tipo_local`
- **Relacionamentos:**
  - Especializações: **PokeCenter**, **Ginásio**, **Pokemart**, **Caminho**, **Zona de Captura**
  - Leva a outros **Locais** (N:M)

---

## PokeCenter
- **Atributos:** `pokecenter_id`, `qtd_npcs`
- **Relacionamentos:**
  - Cura **Time Principal** (1:1)
  - Altera **Time Principal** (1:N)

---

## Ginásio
- **Atributos:** `ginásio_id`, `nome`

---

## Pokemart
- **Atributos:** `pokemart_id`, `qtd_npcs`
- **Relacionamentos:**
  - Negocia **Inst_Item** (N:M)

---

## Caminho
- **Atributos:** `caminho_id`, `qtd_itens`
- **Relacionamentos:**
  - Possui **Inst_Item** (N:M)

---

## Zona de Captura
- **Atributos:** `zona_de_captura_id`, `chance_surgimento`

---

## Pokedex
- **Atributos:** `pokedex_id`, `num_pokedex_id`
- **Relacionamentos:**
  - Revela **Inst_Pokemon** (1:N)
  - Registra **Pokémon** (1:N)

---

## Item
- **Atributos:** `item_id`, `tipo`
- **Relacionamentos:**
  - Especializações: **Pokebola**, **Utilitário**
  - Torna-se **Inst_Item** (1:1)

---

## Pokébola
- **Atributos:** `pokebola_id`, `chance_captura`, `descrição`, `nome`

---

## Utilitário
- **Atributos:** `poção_id`, `taxa_cura`, `efeito`, `descrição`, `nome`

---

## Inst_Item
- **Atributos:** `inst_item_id`, `quantidade`
```
