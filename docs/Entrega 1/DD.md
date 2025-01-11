# Dicionário de dados

<details>
  <summary>Pokémon</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokémon</code> armazena informações sobre cada Pokémon disponível no jogo, incluindo suas características gerais, relações com outros elementos do jogo, e a experiência acumulada para evoluir ou aumentar de nível.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>status_base</code></td>
        <td>Inteiro</td>
        <td>Chave estrangeira para os status básicos do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Deve referenciar uma chave primária válida em outra tabela</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do Pokémon</td>
        <td>Texto (máx. 20 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único</td>
      </tr>
      <tr>
        <td><code>qtd_tipos</code></td>
        <td>Inteiro</td>
        <td>Quantidade de tipos que o Pokémon possui</td>
        <td>Inteiro (1 ou 2)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Valor limitado de 1 a 2</td>
      </tr>
      <tr>
        <td><code>experiencia</code></td>
        <td>Inteiro</td>
        <td>Experiência acumulada pelo Pokémon</td>
        <td>Inteiro positivo ou 0</td>
        <td>Não</td>
        <td>Não</td>
        <td>Usada para calcular progresso de nível</td>
      </tr>
      <tr>
        <td><code>pokedex</code></td>
        <td>Inteiro</td>
        <td>Chave estrangeira para a Pokédex</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Deve referenciar uma chave primária válida na Pokédex</td>
      </tr>
    </tbody>
  </table>
</details>


---

<details>
  <summary>Status_Base</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Status_Base</code> representa os atributos básicos de um Pokémon que determinam sua capacidade de combate e desempenho em batalhas. Esses atributos incluem vida, ataque, defesa e velocidade.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>status_base_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do conjunto de status</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>vida</code></td>
        <td>Inteiro</td>
        <td>Quantidade de vida (HP) base do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>atk</code></td>
        <td>Inteiro</td>
        <td>Poder de ataque base do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>def</code></td>
        <td>Inteiro</td>
        <td>Defesa base do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>velocidade</code></td>
        <td>Inteiro</td>
        <td>Velocidade base do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
    </tbody>
  </table>
</details>


---
<details>
  <summary>Tipo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Tipos</code> representa as classificações elementais dos Pokémon (ex.: Fogo, Água, Grama), que influenciam suas vantagens e desvantagens em batalhas, além de interagir com a eficácia de golpes.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do tipo</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Chave estrangeira que referencia o Pokémon associado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Deve referenciar uma chave primária válida na tabela Pokémon</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do tipo (ex.: Fogo, Água, Grama)</td>
        <td>Texto (máx. 20 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único para cada Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>


---
<details>
  <summary>Eficácia</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Eficácia</code> determina a relação de vantagem ou desvantagem entre tipos de golpes e tipos de defesa, definindo o multiplicador aplicado ao dano em uma interação entre ataque e defesa. Essa entidade é fundamental para calcular os efeitos dos golpes em batalhas.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>eficacia_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da eficácia</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>multiplicador</code></td>
        <td>Decimal</td>
        <td>Multiplicador de eficácia do golpe (ex.: 0.5, 1, 2)</td>
        <td>Números decimais positivos</td>
        <td>Não</td>
        <td>Não</td>
        <td>Valores comuns: 0.5, 1, 2</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Golpe</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Golpe</code> representa os diferentes ataques que um Pokémon pode usar em batalhas. Cada golpe possui atributos que determinam sua categoria, dano, precisão e o número de vezes que pode ser usado.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>golpe_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do golpe</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único</td>
      </tr>
      <tr>
        <td><code>categoria</code></td>
        <td>Texto</td>
        <td>Categoria do golpe (ex.: físico, especial, status)</td>
        <td>Texto (ex.: Físico, Especial, Status)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Valores fixos</td>
      </tr>
      <tr>
        <td><code>dano</code></td>
        <td>Inteiro</td>
        <td>Quantidade de dano base do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>precisao</code></td>
        <td>Decimal</td>
        <td>Precisão do golpe (0 a 1)</td>
        <td>Decimal entre 0 e 1</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve estar entre 0 e 1</td>
      </tr>
      <tr>
        <td><code>num_vezes_pode_usar</code></td>
        <td>Inteiro</td>
        <td>Número de vezes que o golpe pode ser usado (PP)</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Metodo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Metodo</code> representa os diferentes métodos pelos quais um Pokémon pode aprender um golpe, incluindo aprendizado por nível ou outras mecânicas específicas do jogo.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>metodo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do método</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do método de aprendizado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único</td>
      </tr>
      <tr>
        <td><code>nivel</code></td>
        <td>Inteiro</td>
        <td>Nível necessário para aprendizado do golpe (se aplicável)</td>
        <td>Inteiro positivo</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Se for nulo, o método não depende de nível</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>PokeCenter</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>PokeCenter</code> representa os centros Pokémon onde os treinadores podem curar seus Pokémon, acessar o armazenamento de Pokémon e utilizar outros serviços, associados a uma localização e equipe específicos.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokecenter_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do PokeCenter</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>time_pric_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da equipe responsável pelo PokeCenter</td>
        <td>Inteiro positivo (FK para <code>TimePric</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela de equipe (TimePric)</td>
      </tr>
      <tr>
        <td><code>restaura_pokemon</code></td>
        <td>Booleano</td>
        <td>Indica se o PokeCenter restaura os Pokémon</td>
        <td>Booleano (Sim/Não)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Valor padrão: Sim</td>
      </tr>
      <tr>
        <td><code>qtd_npcs</code></td>
        <td>Inteiro</td>
        <td>Quantidade de NPCs disponíveis no PokeCenter</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local onde o PokeCenter está situado</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela de local (Local)</td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo de local onde o PokeCenter está situado (ex.: cidade, vila)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome_cidade</code></td>
        <td>Texto</td>
        <td>Nome da cidade onde o PokeCenter está localizado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>regiao</code></td>
        <td>Texto</td>
        <td>Região onde o PokeCenter se encontra</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

--- 
<details>
  <summary>Ginasio</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Ginasio</code> representa os ginásios Pokémon onde os treinadores podem desafiar líderes de ginásio para ganhar insígnias. Cada ginásio é especializado em um tipo específico de Pokémon e está localizado em uma cidade ou região.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>ginasio_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do ginásio</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>lider</code></td>
        <td>Inteiro</td>
        <td>Identificador do líder do ginásio</td>
        <td>Inteiro positivo (FK para <code>Lider</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela de líderes (Lider)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do ginásio</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local onde o ginásio está situado</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela de local (Local)</td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo de local onde o ginásio está situado (ex.: cidade, vila)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome_cidade</code></td>
        <td>Texto</td>
        <td>Nome da cidade onde o ginásio está localizado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>regiao</code></td>
        <td>Texto</td>
        <td>Região onde o ginásio se encontra</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Inst_Pokemon</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Inst_Pokemon</code> representa uma instância específica de um Pokémon pertencente a um treinador. Inclui informações como a experiência, vida atual e o status atual do Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>inst_pokemon</code></td>
        <td>Inteiro</td>
        <td>Identificador único da instância do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokedex</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon (referência para a tabela <code>Pokemon</code>)</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela Pokémon</td>
      </tr>
      <tr>
        <td><code>time</code></td>
        <td>Inteiro</td>
        <td>Identificador do time ao qual o Pokémon pertence (referência para a tabela <code>Treinador</code>)</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a tabela Treinador</td>
      </tr>
      <tr>
        <td><code>experiencia</code></td>
        <td>Inteiro</td>
        <td>Experiência acumulada pelo Pokémon</td>
        <td>Inteiro positivo ou 0</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>vida_atual</code></td>
        <td>Inteiro</td>
        <td>Vida atual do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>status</code></td>
        <td>Texto</td>
        <td>Status atual do Pokémon (ex.: saudável, envenenado)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Time_Principal</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Time_Principal</code> representa o time principal de Pokémon de um treinador. Inclui informações sobre a ordem dos Pokémon que fazem parte do time principal.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>time_princ_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do time principal</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>ordem</code></td>
        <td>Inteiro</td>
        <td>Posição do Pokémon no time principal</td>
        <td>Inteiro positivo (1 a 6)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser entre 1 e 6</td>
      </tr>
      <tr>
        <td><code>cura_pokecenter_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokécenter onde o Pokémon foi curado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Pokécenter</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Pokemon_Selvagem</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokemon_Selvagem</code> representa os Pokémon que podem ser encontrados na natureza, sem pertencer a nenhum treinador. Inclui informações sobre a taxa de aparição e os níveis mínimo e máximo desses Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>taxa_aparicao</code></td>
        <td>Decimal</td>
        <td>Taxa de aparição do Pokémon selvagem (0 a 1)</td>
        <td>Decimal entre 0 e 1</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser entre 0 e 1</td>
      </tr>
      <tr>
        <td><code>nivel_min</code></td>
        <td>Inteiro</td>
        <td>Nível mínimo do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>nivel_max</code></td>
        <td>Inteiro</td>
        <td>Nível máximo do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0 e maior que o nível mínimo</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Pokedex</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokedex</code> representa a enciclopédia digital que registra informações sobre todos os Pokémon que um treinador encontrou e capturou. Inclui detalhes como o número da Pokédex e informações gerais sobre o Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokedex_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da Pokedex</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>num_pokedex</code></td>
        <td>Inteiro</td>
        <td>Número do Pokémon na Pokédex</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único para cada Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Local</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Local</code> representa os diferentes locais no mundo Pokémon onde eventos podem ocorrer, como cidades, rotas, cavernas, etc. Inclui informações sobre o nome, tipo e descrição do local.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do local</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo de local (ex.: cidade, rota, caverna, etc.)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---

<details>
  <summary>Caminho</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Caminho</code> representa as conexões entre diferentes locais no mundo Pokémon, como cidades e rotas. Inclui informações sobre os locais de origem e destino, a quantidade de itens disponíveis e outros detalhes relacionados à conexão.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>caminho_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do caminho</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>qtd_itens</code></td>
        <td>Inteiro</td>
        <td>Quantidade de itens disponíveis ao longo do caminho</td>
        <td>Inteiro não negativo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local de origem</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo de local (ex.: cidade, rota, etc.)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome_cidade</code></td>
        <td>Texto</td>
        <td>Nome da cidade ou local associado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>regiao</code></td>
        <td>Texto</td>
        <td>Nome da região em que o caminho se localiza</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---

<details>
  <summary>Zona_de_captura</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Zona_de_captura</code> representa as áreas específicas onde os Pokémon podem ser capturados. Inclui informações sobre a localização, a chance de surgimento dos Pokémon e os tipos de Pokémon que podem ser encontrados nessas zonas.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>zona_de_captura_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da zona de captura</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>chance_surgimento</code></td>
        <td>Decimal</td>
        <td>Chance de surgimento de Pokémon selvagens na zona (valor entre 0 e 1)</td>
        <td>Decimal entre 0 e 1</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser entre 0 e 1</td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local da zona de captura</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo do local (ex.: cidade, rota, etc.) onde a captura pode ocorrer</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome_cidade</code></td>
        <td>Texto</td>
        <td>Nome da cidade ou local associado à zona de captura</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>regiao</code></td>
        <td>Texto</td>
        <td>Nome da região em que a zona de captura está localizada</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Pokémart</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokémart</code> representa as lojas onde os treinadores podem comprar itens como Pokébolas, poções e outros suprimentos. Inclui informações sobre a localização, quantidade de NPCs (personagens não jogáveis), e os itens disponíveis para venda.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokemart_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do Pokémart</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>qtd_npcs</code></td>
        <td>Inteiro</td>
        <td>Quantidade de NPCs (personagens não jogáveis) no Pokémart</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local do Pokémart</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_local</code></td>
        <td>Texto</td>
        <td>Tipo do local onde o Pokémart está situado (ex: cidade, rota, etc.)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome_cidade</code></td>
        <td>Texto</td>
        <td>Nome da cidade ou local associado ao Pokémart</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>regiao</code></td>
        <td>Texto</td>
        <td>Região onde o Pokémart está localizado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Time</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Time</code> representa um grupo de Pokémon que um treinador possui. Inclui informações sobre o treinador, o time principal e a quantidade de Pokémon no time.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>time_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do time</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>time_principal</code></td>
        <td>Inteiro</td>
        <td>Identificador do time principal (FK para <code>Time</code>)</td>
        <td>Inteiro positivo (FK)</td>
        <td>Sim</td>
        <td>FK</td>
        <td>Pode ser nulo, indicando que é o time principal</td>
      </tr>
      <tr>
        <td><code>qtd_pokemons</code></td>
        <td>Inteiro</td>
        <td>Quantidade de Pokémon no time</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Treinador</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Treinador</code> representa os treinadores de Pokémon. Inclui informações pessoais e detalhes sobre o progresso do treinador no mundo Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>time</code></td>
        <td>Inteiro</td>
        <td>Identificador do time do treinador</td>
        <td>Inteiro positivo (FK para <code>Time</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com o time principal</td>
      </tr>
      <tr>
        <td><code>mochila</code></td>
        <td>Inteiro</td>
        <td>Identificador da mochila do treinador</td>
        <td>Inteiro positivo (FK para <code>Mochila</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com os itens da mochila</td>
      </tr>
      <tr>
        <td><code>local_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local atual do treinador</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com o local atual</td>
      </tr>
      <tr>
        <td><code>tipo_treinador</code></td>
        <td>Texto</td>
        <td>Tipo do treinador (ex: "Treinador", "Gim Leader", etc.)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Informar o tipo de treinador</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Mochila</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Mochila</code> representa a mochila de um treinador, onde são armazenados os itens coletados durante a jornada. Inclui informações sobre os itens e suas quantidades.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>mochila_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da mochila</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokedex_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da Pokédex do treinador</td>
        <td>Inteiro positivo (FK para <code>Pokédex</code>)</td>
        <td>Não</td>
        <td>FK</td>
        <td>Relacionamento com a Pokédex do treinador</td>
      </tr>
      <tr>
        <td><code>qtd_itens</code></td>
        <td>Inteiro</td>
        <td>Quantidade total de itens na mochila</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>item</code></td>
        <td>Inteiro</td>
        <td>item armazenado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>

---

<details>
  <summary>Item</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Item</code> representa os diferentes itens que podem ser encontrados e utilizados pelos treinadores no mundo Pokémon. Inclui informações sobre o tipo dos itens.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do item</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>tipo</code></td>
        <td>Texto</td>
        <td>Tipo do item</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Define o tipo do item, como "cura", "status", "pokébola", etc.</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>Pokebola</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokebola</code> representa os diferentes tipos de Pokébolas usadas para capturar Pokémon. Inclui informações sobre o nome, taxa de cura, efeito e descrição das Pokébolas.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokebola_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da Pokébola</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do item associado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Item</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome da Pokébola</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>taxa_cura</code></td>
        <td>Decimal</td>
        <td>Taxa de cura da Pokébola</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>efeito</code></td>
        <td>Texto</td>
        <td>Efeito da Pokébola</td>
        <td>Texto (máx. 150 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição da Pokébola</td>
        <td>Texto (máx. 150 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>Líder</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Líder</code> representa os líderes de ginásio no mundo Pokémon. Inclui informações sobre o nome, insígnia e status do líder.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>lider_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do líder</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador associado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do líder</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>insigna</code></td>
        <td>Texto</td>
        <td>Insígnia do líder</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>status</code></td>
        <td>Texto</td>
        <td>Status do líder</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>NPC</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>NPC</code> representa os personagens não jogáveis (Non-Playable Characters) no mundo Pokémon. Inclui informações sobre o nome, nível de dificuldade e falas dos NPCs.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>npc_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do NPC</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador associado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do NPC</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nivel_dificuldade</code></td>
        <td>Texto</td>
        <td>Nível de dificuldade do NPC</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>falas</code></td>
        <td>Texto</td>
        <td>Falas do NPC</td>
        <td>Texto (máx. 250 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>PC</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>PC</code> representa os computadores encontrados nos PokeCenters, onde os treinadores podem armazenar e gerenciar seus Pokémon. Inclui informações sobre a capacidade de armazenamento e os Pokémon armazenados.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>player_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do PC</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do PC</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>num_insigneas_coletadas</code></td>
        <td>Inteiro</td>
        <td>Número de insígnias coletadas</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>

---
<details>
  <summary>Utilitário</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Utilitário</code> representa os diferentes itens utilitários que podem ser usados pelos treinadores no mundo Pokémon. Inclui informações sobre o nome, descrição e efeitos dos utilitários.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pocao_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do utilitário</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do item associado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Item</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do utilitário</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>taxa_cura</code></td>
        <td>Decimal</td>
        <td>Taxa de cura do utilitário</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>efeito</code></td>
        <td>Texto</td>
        <td>Efeito do utilitário</td>
        <td>Texto (máx. 150 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição do utilitário</td>
        <td>Texto (máx. 150 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>aprende_golpe_metodo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>aprende_golpe_metodo</code> representa a relação entre os métodos de aprendizado e os golpes que podem ser aprendidos por um Pokémon. Inclui informações sobre os identificadores do método e do golpe.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>metodo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do método de aprendizado</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Método</td>
      </tr>
      <tr>
        <td><code>golpe_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Golpe</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>golpe_eficacia</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>golpe_eficacia</code> representa a relação entre os golpes e suas eficácias contra diferentes tipos de Pokémon. Inclui informações sobre os identificadores do golpe e da eficácia.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>golpe_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Golpe</td>
      </tr>
      <tr>
        <td><code>eficacia_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da eficácia</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Eficácia</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>golpe_tipo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>golpe_tipo</code> representa a relação entre os golpes e os tipos de Pokémon. Inclui informações sobre os identificadores do golpe e do tipo.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>golpe_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Golpe</td>
      </tr>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Tipo</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>pokemon_golpe</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>pokemon_golpe</code> representa a relação entre os Pokémon e os golpes que eles podem aprender. Inclui informações sobre os identificadores do golpe e do Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>golpe_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do golpe</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Golpe</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>eficacia_tipo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>eficacia_tipo</code> representa a relação entre as eficácias e os tipos de Pokémon. Inclui informações sobre os identificadores da eficácia e do tipo.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>eficacia_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da eficácia</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Eficácia</td>
      </tr>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Tipo</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>negocia</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>negocia</code> representa a relação entre os Pokémarts e os itens que eles negociam, incluindo o preço dos itens. Inclui informações sobre os identificadores do Pokémart e do item, além do preço.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokemart_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémart</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémart</td>
      </tr>
      <tr>
        <td><code>inst_item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do item</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Item</td>
      </tr>
      <tr>
        <td><code>preco</code></td>
        <td>Decimal</td>
        <td>Preço do item</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>

---

<details>
  <summary>Surge</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Surge</code> representa a relação entre as zonas de captura e os Pokémon selvagens que podem surgir nessas zonas, incluindo a chance de surgimento. Inclui informações sobre os identificadores da zona de captura e do Pokémon selvagem, além da chance de surgimento.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>zona_de_captura_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da zona de captura</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td></td>
      </tr>
      <tr>
        <td><code>selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Pokémon_Selvagem</td>
      </tr>
      <tr>
        <td><code>chance_surgimento</code></td>
        <td>Decimal</td>
        <td>Chance de surgimento do Pokémon selvagem</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>caminho_inst_item</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>caminho_inst_item</code> representa a relação entre os caminhos e os itens que podem ser encontrados nesses caminhos. Inclui informações sobre os identificadores do caminho e do item.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>caminho_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do caminho</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Caminho</td>
      </tr>
      <tr>
        <td><code>inst_item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do item</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Item</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>local_leva_a_local</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>local_leva_a_local</code> representa a relação entre dois locais, indicando que um local leva a outro. Inclui informações sobre os identificadores dos dois locais.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>local_id_1</code></td>
        <td>Inteiro</td>
        <td>Identificador do primeiro local</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Local</td>
      </tr>
      <tr>
        <td><code>local_id_2</code></td>
        <td>Inteiro</td>
        <td>Identificador do segundo local</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Local</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>pokemon_tipo</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>pokemon_tipo</code> representa a relação entre os tipos de Pokémon e os próprios Pokémon. Inclui informações sobre os identificadores do tipo e do Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Tipo</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>possui</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>possui</code> representa a relação entre as instâncias de Pokémon e os próprios Pokémon. Inclui informações sobre os identificadores da instância de Pokémon e do Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>inst_pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da instância de Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Inst_Pokemon</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>evolucao_pokemon</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>evolucao_pokemon</code> representa a relação de evolução entre dois Pokémon, indicando que um Pokémon evolui para outro a partir de um nível mínimo. Inclui informações sobre os identificadores dos dois Pokémon e o nível mínimo de evolução.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokemon_id_1</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon que evolui</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
      <tr>
        <td><code>pokemon_id_2</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon evoluído</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
      <tr>
        <td><code>nivel_min</code></td>
        <td>Inteiro</td>
        <td>Nível mínimo para evolução</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>upar_pokemon</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>upar_pokemon</code> representa os níveis de um Pokémon e a experiência necessária para alcançar cada nível. Inclui informações sobre o identificador do Pokémon, o nível e a experiência necessária.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
      <tr>
        <td><code>nivel</code></td>
        <td>Inteiro</td>
        <td>Nível do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>exp_necessaria</code></td>
        <td>Inteiro</td>
        <td>Experiência necessária para alcançar o nível</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>encontra</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>encontra</code> representa a relação entre os Pokémon selvagens e os treinadores que os encontram. Inclui informações sobre os identificadores do Pokémon selvagem e do treinador.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon_Selvagem</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>captura</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>captura</code> representa a relação entre os Pokémon selvagens e os treinadores que os capturam, incluindo a chance base e a chance atual de captura. Inclui informações sobre os identificadores do Pokémon selvagem e do treinador, além das chances de captura.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon_Selvagem</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>chance_base</code></td>
        <td>Decimal</td>
        <td>Chance base de captura</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
      <tr>
        <td><code>chance_atual</code></td>
        <td>Decimal</td>
        <td>Chance atual de captura</td>
        <td>Decimal positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Default 0</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>torna</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>torna</code> representa a relação entre os Pokémon selvagens e os Pokémon que eles se tornam após serem capturados. Inclui informações sobre os identificadores do Pokémon selvagem e do Pokémon.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon_Selvagem</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Pokémon</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>batalha</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>batalha</code> representa uma batalha entre dois treinadores, incluindo o resultado, a ordem e a recompensa da batalha. Inclui informações sobre os identificadores da batalha e dos treinadores.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>batalha_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da batalha</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id_1</code></td>
        <td>Inteiro</td>
        <td>Identificador do primeiro treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>treinador_id_2</code></td>
        <td>Inteiro</td>
        <td>Identificador do segundo treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>resultado</code></td>
        <td>Texto</td>
        <td>Resultado da batalha</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>ordem</code></td>
        <td>Inteiro</td>
        <td>Ordem da batalha</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>recompensa</code></td>
        <td>Texto</td>
        <td>Recompensa da batalha</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>treinador_interacao</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>treinador_interacao</code> representa a interação entre dois treinadores. Inclui informações sobre os identificadores dos dois treinadores.</p>

  <h3>Atributos</h3>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nome Variável</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Valores Permitidos</th>
        <th>Permite Valores Nulos?</th>
        <th>É Chave?</th>
        <th>Outras Restrições</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>treinador_id_1</code></td>
        <td>Inteiro</td>
        <td>Identificador do primeiro treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
      <tr>
        <td><code>treinador_id_2</code></td>
        <td>Inteiro</td>
        <td>Identificador do segundo treinador</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>PK, FK</td>
        <td>Referência à tabela Treinador</td>
      </tr>
    </tbody>
  </table>

</details>

