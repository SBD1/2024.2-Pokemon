# Dicionário de dados

## Entidade: `Pokémon`

### Descrição:
A entidade `Pokémon` armazena informações sobre cada Pokémon disponível no jogo, incluindo suas características gerais, relações com outros elementos do jogo, e a experiência acumulada para evoluir ou aumentar de nível.

---

### Atributos:

### Tabela: Pokémon

| **Nome Variável** | **Tipo**    | **Descrição**                                     | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|--------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `pokemon_id`       | Inteiro    | Identificador único do Pokémon                   | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`             | Texto      | Nome do Pokémon                                  | Texto (máx. 100 caracteres)                 | Não                        | Não          | Deve ser único                                |
| `genero`           | Texto      | Gênero do Pokémon                                | `Masculino`, `Feminino`, `Indefinido`       | Não                        | Não          | Valores fixos                                |
| `qtd_tipos`        | Inteiro    | Quantidade de tipos que o Pokémon possui         | Inteiro (1 ou 2)                            | Não                        | Não          | Valor limitado de 1 a 2                      |
| `experiencia`      | Inteiro    | Experiência acumulada pelo Pokémon               | Inteiro positivo ou 0                       | Não                        | Não          | Usada para calcular progresso de nível       |

---

## Entidade: `Status_Base`

### Descrição:
A entidade `Status_Base` representa os atributos básicos de um Pokémon que determinam sua capacidade de combate e desempenho em batalhas. Esses atributos incluem vida, ataque, defesa e velocidade.

---

### Atributos:

### Tabela: Status_Base

| **Nome Variável** | **Tipo**    | **Descrição**                                     | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|--------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `status_id`        | Inteiro    | Identificador único do conjunto de status        | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `vida`             | Inteiro    | Quantidade de vida (HP) base do Pokémon          | Inteiro positivo                            | Não                        | Não          | Deve ser maior que 0                          |
| `atk`              | Inteiro    | Poder de ataque base do Pokémon                  | Inteiro positivo                            | Não                        | Não          | Deve ser maior que 0                          |
| `def`              | Inteiro    | Defesa base do Pokémon                           | Inteiro positivo                            | Não                        | Não          | Deve ser maior que 0                          |
| `velocidade`       | Inteiro    | Velocidade base do Pokémon                       | Inteiro positivo                            | Não                        | Não          | Deve ser maior que 0                          |

---
### Entidade: `Tipos`

### Descrição:
A entidade `Tipos` representa as classificações elementais dos Pokémon (ex.: Fogo, Água, Grama), que influenciam suas vantagens e desvantagens em batalhas, além de interagir com a eficácia de golpes.

---

### Tabela: Tipos

| **Nome Variável** | **Tipo**    | **Descrição**                                     | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|--------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `tipo_id`          | Inteiro    | Identificador único do tipo                      | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`             | Texto      | Nome do tipo (ex.: Fogo, Água, Grama)            | Texto (máx. 50 caracteres)                  | Não                        | Não          |                                               |

---
### Entidade: `Eficácia`

### Descrição:
A entidade `Eficácia` determina a relação de vantagem ou desvantagem entre tipos de golpes e tipos de defesa, definindo o multiplicador aplicado ao dano em uma interação entre ataque e defesa. Essa entidade é fundamental para calcular os efeitos dos golpes em batalhas.

---

### Tabela: Eficácia

| **Nome Variável**     | **Tipo**    | **Descrição**                                        | **Valores Permitidos**               | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**              |
|------------------------|------------|-----------------------------------------------------|--------------------------------------|----------------------------|--------------|------------------------------------|
| `golpe_atacante_id`    | Inteiro    | Identificador do tipo de golpe atacante             | Inteiro positivo (FK para `Golpe`)   | Não                        | Sim          | Chave composta com `golpe_defensor_id` |
| `golpe_defensor_id`    | Inteiro    | Identificador do tipo de golpe defensor             | Inteiro positivo (FK para `Golpe`)   | Não                        | Sim          | Chave composta com `golpe_atacante_id` |
| `multiplicador`        | Decimal    | Multiplicador de eficácia do golpe (ex.: 0.5, 1, 2) | Números decimais positivos           | Não                        | Não          | Valores comuns: 0.5, 1, 2           |

---
### Entidade: `Golpe`

### Descrição:
A entidade `Golpe` representa os ataques que um Pokémon pode usar durante as batalhas. Cada golpe possui características específicas, como nome, categoria, dano, precisão e a quantidade de vezes que pode ser utilizado, além de interagir com a eficácia dependendo do tipo do Pokémon defensor.

---

### Tabela: Golpe

| **Nome Variável**         | **Tipo**    | **Descrição**                                      | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|----------------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `golpe_id`                 | Inteiro    | Identificador único do golpe                      | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`                     | Texto      | Nome do golpe (ex.: Flamethrower, Water Gun)      | Texto (máx. 100 caracteres)                 | Não                        | Não          |                                               |
| `categoria`                | Texto      | Categoria do golpe (ex.: Físico, Especial, etc.)  | Texto (valores fixos como 'Físico', 'Especial', etc.) | Não                        | Não          |                                               |
| `dano`                     | Inteiro    | Quantidade de dano causado pelo golpe             | Inteiro positivo                            | Não                        | Não          | Valor maior que 0                            |
| `precisao`                 | Decimal    | Probabilidade de acerto do golpe (de 0 a 100)     | Decimal entre 0 e 100                       | Não                        | Não          | Valor entre 0 e 100                          |
| `numvezes_pode_usar`       | Inteiro    | Número de vezes que o golpe pode ser utilizado    | Inteiro positivo                            | Não                        | Não          | Limite de usos do golpe em batalhas          |

---
### Entidade: `Metodo`

### Descrição:
A entidade `Metodo` define os métodos de aprendizagem de golpes para os Pokémon. Cada método está associado a um nome e a um nível de aprendizagem, representando quando o Pokémon pode aprender um golpe específico.

---

### Tabela: Metodo

| **Nome Variável** | **Tipo**    | **Descrição**                                      | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|--------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `metodo_id`        | Inteiro    | Identificador único do método de aprendizagem     | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`             | Texto      | Nome do método (ex.: Aprender, TMT, etc.)         | Texto (máx. 100 caracteres)                 | Não                        | Não          |                                               |
| `nivel`            | Inteiro    | Nível necessário para o Pokémon aprender o golpe | Inteiro positivo                            | Não                        | Não          | Deve ser um número positivo                   |

---
### Entidade: `PokeCenter`

### Descrição:
A entidade `PokeCenter` representa as instalações onde os Pokémon podem ser curados e onde o time principal do jogador pode ser alterado. Além disso, o PokeCenter herda atributos da cidade onde está localizado, como nome e características da cidade.

---

### Tabela: PokeCenter

| **Nome Variável**  | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|---------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `pokecenter_id`     | Inteiro    | Identificador único do PokeCenter                   | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |

--- 
### Entidade: `Ginasio`

### Descrição:
A entidade `Ginasio` representa os ginásios onde o jogador pode desafiar líderes para ganhar insígnias. Cada ginásio tem um nome e está localizado em uma cidade específica, além de estar associado a um líder.

---

### Tabela: Ginasio

| **Nome Variável** | **Tipo**    | **Descrição**                                      | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|--------------------|------------|--------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `ginasio_id`       | Inteiro    | Identificador único do ginásio                    | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`             | Texto      | Nome do ginásio                                  | Texto (máx. 100 caracteres)                 | Não                        | Não          |                                               |

---
### Entidade: `Inst_Pokemon`

### Descrição:
A entidade `Inst_Pokemon` representa uma instância específica de um Pokémon no jogo, incluindo sua experiência atual, HP atual e o status atual. Essa instância está vinculada à revelação na Pokédex, à integração no time do jogador e à possibilidade de ser um Pokémon selvagem.

---

### Tabela: Inst_Pokemon

| **Nome Variável**   | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|----------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `int_pokemon_id`     | Inteiro    | Identificador único da instância do Pokémon         | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `experiencia`        | Inteiro    | Experiência acumulada pela instância do Pokémon     | Inteiro positivo                            | Não                        | Não          |                                               |
| `hp_tual`            | Inteiro    | HP atual da instância do Pokémon                    | Inteiro positivo                            | Não                        | Não          | Deve ser maior que 0                          |
| `status`             | Texto      | Status atual da instância do Pokémon (ex.: Vivo, Desmaiado) | Texto (máx. 20 caracteres)                  | Não                        | Não          |                                               |

---
### Entidade: `Time_Principal`

### Descrição:
A entidade `Time_Principal` representa o time de Pokémon do jogador, contendo a ordem dos Pokémon que o compõem. Este time pode ser alterado e curado no PokeCenter, sendo essencial para as batalhas do jogo.

---

### Tabela: Time_Principal

| **Nome Variável**   | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|----------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `time_princ_id`      | Inteiro    | Identificador único do time principal               | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `ordem`              | Inteiro    | Ordem dos Pokémon no time principal                 | Inteiro positivo                            | Não                        | Não          | Ordem deve ser única dentro de cada time      |

---
### Entidade: `Cidade`

### Descrição:
A entidade `Cidade` representa as diversas cidades no mundo do jogo, contendo informações como nome e identificação. Cada cidade está vinculada a um local específico e pode abrigar diversas instalações e estabelecimentos como PokeCenter, Ginásio e PokéMart.

---

### Tabela: Cidade

| **Nome Variável**   | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|----------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `cidade_id`          | Inteiro    | Identificador único da cidade                        | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `nome`               | Texto      | Nome da cidade                                     | Texto (máx. 100 caracteres)                 | Não                        | Não          |                                               |

---
### Entidade: `Pokemon_Selvagem`

### Descrição:
A entidade `Pokemon_Selvagem` representa os Pokémon que aparecem nas zonas selvagens do jogo. Ela contém informações sobre a taxa de aparição, os níveis mínimos e máximos de um Pokémon selvagem, além de estar associada a interações com o treinador e zonas de captura.

---

### Tabela: Pokemon_Selvagem

| **Nome Variável**    | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|-----------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `selvagem_id`         | Inteiro    | Identificador único do Pokémon selvagem             | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `taxa_aparicao`       | Decimal    | Taxa de aparição do Pokémon selvagem                | Decimal entre 0 e 1 (percentual)            | Não                        | Não          | Deve ser entre 0 e 1                         |
| `nivel_min`           | Inteiro    | Nível mínimo do Pokémon selvagem                    | Inteiro positivo                            | Não                        | Não          | Nível mínimo deve ser maior que 0            |
| `nivel_max`           | Inteiro    | Nível máximo do Pokémon selvagem                    | Inteiro positivo                            | Não                        | Não          | Nível máximo deve ser maior que `nivel_min`   |

---
### Entidade: `Pokedex`

### Descrição:
A entidade `Pokedex` representa o registro digital dos Pokémon encontrados pelo jogador durante sua jornada. Cada entrada na Pokédex contém um número único de identificação e informações sobre o Pokémon, revelando detalhes sobre o Pokémon registrado e estando vinculada à mochila do jogador.

---

### Tabela: Pokedex

| **Nome Variável**    | **Tipo**    | **Descrição**                                        | **Valores Permitidos**                       | **Permite Valores Nulos?** | **É Chave?** | **Outras Restrições**                          |
|-----------------------|------------|-----------------------------------------------------|---------------------------------------------|----------------------------|--------------|-----------------------------------------------|
| `pokedex_id`          | Inteiro    | Identificador único da entrada na Pokédex           | Inteiro positivo                            | Não                        | Sim          | Gerado automaticamente (autoincremento)       |
| `num_pokedex`         | Inteiro    | Número único do Pokémon na Pokédex                  | Inteiro positivo                            | Não                        | Não          | Valor único para cada Pokémon registrado      |

---
### Entidade: Local

Descrição: A entidade **Local** descreve locais presentes no jogo, como PokéCenters, Ginásios e Pokémarts, com informações como identificador, tipo, região e quantidade de NPCs.

| Nome da Variável | Tipo         | Descrição                       | Valores Permitidos | Permite Valores Nulos? | É Chave? | Outras Restrições |
|------------------|--------------|---------------------------------|--------------------|-------------------------|----------|-------------------|
| local_id         | int          | Identificador único do local   | 1-1000             | não                     | PK       |                   |
| tipo_local       | varchar(50)  | Tipo do local                  | PokéCenter, Ginásio, Pokémart | não          |          |
| regiao           | varchar(100) | Região associada ao local      | a-z, A-Z           | não                     |          |                   |
| quantidade_npc   | int          | Quantidade de NPCs no local    | 0-100              | não                     |          |                   |

---
### Entidade: Rota

Descrição: A entidade **Rota** descreve as rotas conectadas às cidades, com informações como identificador único e nome ou número.

Observação: Esta tabela está relacionada à entidade **Cidade**.

| Nome da Variável | Tipo         | Descrição                        | Valores Permitidos | Permite Valores Nulos? | É Chave? | Outras Restrições |
|------------------|--------------|----------------------------------|--------------------|-------------------------|----------|-------------------|
| rota_id          | int          | Identificador único da rota     | 1-500              | não                     | PK       |                   |
| nome/numero      | varchar(50)  | Nome ou número da rota          | a-z, A-Z, 0-9      | não                     |          |                   |

---

### Entidade: Caminho

Descrição: A entidade **Caminho** descreve os caminhos dentro das rotas, permitindo definir trajetos específicos.


| Nome da Variável | Tipo         | Descrição                  | Valores Permitidos | Permite Valores Nulos? | É Chave? | Outras Restrições |
|------------------|--------------|----------------------------|--------------------|-------------------------|----------|-------------------|
| caminho_id       | int          | Identificador único do caminho | 1-1000           | não                     | PK       |                   |

---

### Entidade: Zona_de_captura

Descrição: A entidade **Zona_de_captura** descreve as áreas onde os jogadores podem capturar Pokémon, com um vínculo ao local correspondente.


| Nome da Variável | Tipo         | Descrição                        | Valores Permitidos | Permite Valores Nulos? | É Chave? | Outras Restrições |
|------------------|--------------|----------------------------------|--------------------|-------------------------|----------|-------------------|
| local_id         | int          | Identificador único do local    | 1-1000             | não                     | FK       | Relacionado à entidade **Local** |


---
### Entidade: Pokémart

Descrição: A entidade **Pokémart** descreve as lojas do jogo onde os jogadores podem comprar itens.


| Nome da Variável | Tipo         | Descrição                  | Valores Permitidos | Permite Valores Nulos? | É Chave? | Outras Restrições |
|------------------|--------------|----------------------------|--------------------|-------------------------|----------|-------------------|
| local_id         | int          | Identificador único do local | 1-1000            | não                     | FK       | Relacionado à entidade **Local** |

---
### Entidade: Time

**Descrição**: A entidade Time descreve os times disponíveis no jogo, incluindo identificadores e a ordem associada.

| Nome Variável | Tipo      | Descrição                     | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|---------------|-----------|-------------------------------|--------------------|-------------------------|----------|----------------------------|
| Time_id       | int       | Identificador único do time   | 1-1000             | não                     | PK       |                            |
| Time_princ_id | int       | Identificador do time principal | 1-1000           | não                     | FK       | Relacionado a Time         |
| Ordem         | int       | Ordem do time                | 1-10                | não                     |          |                            |


---

### Entidade: Treinador

**Descrição**: A entidade Treinador armazena informações sobre os personagens que treinam Pokémons, com detalhes como nome e tipo.

| Nome Variável    | Tipo          | Descrição                         | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|------------------|---------------|-----------------------------------|--------------------|------------------------|----------|----------------------------|
| Treinador_id     | int           | Identificador único do treinador | 1-1000              | não                    | PK       |                            |
| Nome             | varchar[100] | Nome do treinador                 | a-z, A-Z            | não                    |          |                            |
| Tipo_treinador   | varchar[50]  | Tipo do treinador (iniciante, avançado) | valores específicos | sim              |          |                            |

---

### Entidade: Mochila

**Descrição**: A entidade Mochila representa os itens carregados pelos treinadores no jogo, com um identificador exclusivo.

| Nome Variável  | Tipo  | Descrição                         | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|-----------------|-------|-----------------------------------|--------------------|-------------------------|----------|----------------------------|
| Mochila_id      | int   | Identificador único da mochila   | 1-1000             | não                     | PK        |                            |

---

### Entidade: Item

**Descrição**: A entidade Item armazena informações sobre os objetos que podem ser encontrados no jogo, como descrição e tipo.

| Nome Variável | Tipo          | Descrição                     | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|---------------|---------------|-------------------------------|--------------------|-------------------------|----------|----------------------------|
| Item_id       | int           | Identificador único do item  | 1-1000             | não                      | PK       |                            |
| Descrição     | varchar[150]  | Descrição do item             | a-z, A-Z           | sim                     |          |                            |

---

### Entidade: Pokebola

**Descrição**: A entidade Pokebola descreve as bolas utilizadas para capturar Pokémons, incluindo chance de captura e descrição.

| Nome Variável    | Tipo          | Descrição                           | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|------------------|---------------|-------------------------------------|--------------------|-------------------------|----------|----------------------------|
| Pokebola_id      | int           | Identificador único da Pokébola    | 1-1000             | não                      | PK       |                            |
| Chance_Captura   | decimal(3,2)  | Taxa de chance de captura (%)       | 0.01-1.00          | não                     |          |                            |
| Descrição        | varchar[150]  | Descrição da Pokébola               | texto              | sim                     |          |                            |

---

### Entidade: Líder

**Descrição**: A entidade Líder representa líderes de ginásio, com informações sobre suas insígnias.

| Nome Variável | Tipo          | Descrição                           | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|---------------|---------------|-------------------------------------|--------------------|-------------------------|----------|----------------------------|
| Líder_id      | int           | Identificador único do líder        | 1-1000             | não                     | PK       |                            |
| Insígnia      | varchar[100]  | Nome ou descrição da insígnia       | texto              | não                     |          |                            |

---

### Entidade: NPC

**Descrição**: A entidade NPC representa os personagens não jogáveis, com detalhes como nível de dificuldade e falas associadas.

| Nome Variável        | Tipo          | Descrição                           | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|----------------------|---------------|-------------------------------------|--------------------|-------------------------|----------|----------------------------|
| NPC_id              | int           | Identificador único do NPC          | 1-1000             | não                     | PK       |                            |
| Nível_dificuldade   | int           | Nível de dificuldade apresentado    | 1-10               | não                     |          |                            |
| Falas               | varchar[255]  | Texto ou falas associadas ao NPC    | texto              | sim                     |          |                            |

---

### Entidade: PC

**Descrição**: A entidade PC armazena informações sobre os jogadores e suas insígnias coletadas.

| Nome Variável              | Tipo  | Descrição                            | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|----------------------------|-------|--------------------------------------|--------------------|-------------------------|----------|----------------------------|
| Player_id                  | int   | Identificador único do jogador       | 1-1000             | não                     | PK       |                            |
| Num_insígnias_coletadas    | int   | Número de insígnias coletadas pelo jogador | 0-8          | sim                     |          |                            |

---

### Entidade: Utilitário

**Descrição**: A entidade Utilitário armazena informações sobre itens de cura e evolução disponíveis no jogo.

| Nome Variável  | Tipo          | Descrição                     | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|----------------|---------------|-------------------------------|--------------------|-------------------------|----------|----------------------------|
| Poção_id       | int           | Identificador único da poção  | 1-1000             | não                     | PK       |                            |
| Taxa_cura      | decimal(3,2)  | Porcentagem de cura aplicada  | 0.01-1.00          | não                     |          |                            |
| Efeito         | varchar[100]  | Efeito causado pelo item      | texto              | sim                     |          |                            |
| Descrição      | varchar[150]  | Descrição do utilitário       | texto              | sim                     |          |                            |

---

### Entidade: Evolução

**Descrição**: A entidade Evolução descreve os tipos e processos de evolução disponíveis no jogo.

| Nome Variável    | Tipo          | Descrição                           | Valores Permitidos | Permite Valores Nulos? | É chave? | Outras Restrições          |
|------------------|---------------|-------------------------------------|--------------------|-------------------------|----------|----------------------------|
| Evolução_id      | int           | Identificador único da evolução     | 1-1000             | não                     | PK       |                            |
| Tipo_evolução    | varchar[50]   | Tipo de evolução realizada          | texto              | não                     |          |                            |
| Descrição        | varchar[150]  | Descrição da evolução               | texto              | sim                     |          |                            |

---
