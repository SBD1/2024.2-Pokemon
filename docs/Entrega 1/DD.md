# Dicionário de dados

<details>
  <summary>Pokemón</summary>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do Pokémon</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser único</td>
      </tr>
      <tr>
        <td><code>genero</code></td>
        <td>Texto</td>
        <td>Gênero do Pokémon</td>
        <td><code>Macho</code> e <code>Fêmea</code></td>
        <td>Não</td>
        <td>Não</td>
        <td>Valores fixos</td>
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
        <td><code>status_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do conjunto de status</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
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
  <summary>Tipos</summary>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do tipo (ex.: Fogo, Água, Grama)</td>
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
        <td><code>golpe_atacante_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo de golpe atacante</td>
        <td>Inteiro positivo (FK para <code>Golpe</code>)</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Chave composta com <code>golpe_defensor_id</code></td>
      </tr>
      <tr>
        <td><code>golpe_defensor_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo de golpe defensor</td>
        <td>Inteiro positivo (FK para <code>Golpe</code>)</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Chave composta com <code>golpe_atacante_id</code></td>
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
  <p>A entidade <code>Golpe</code> representa os diferentes ataques que um Pokémon pode usar em batalhas. Cada golpe possui atributos que determinam seu tipo, poder, precisão e outros efeitos.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do golpe</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo do golpe</td>
        <td>Inteiro positivo (FK para <code>Tipos</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>poder</code></td>
        <td>Inteiro</td>
        <td>Poder base do golpe</td>
        <td>Inteiro positivo</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Deve ser maior que 0 se não for nulo</td>
      </tr>
      <tr>
        <td><code>precisao</code></td>
        <td>Decimal</td>
        <td>Precisão do golpe (0 a 1)</td>
        <td>Decimal entre 0 e 1</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Deve ser entre 0 e 1 se não for nulo</td>
      </tr>
      <tr>
        <td><code>pp</code></td>
        <td>Inteiro</td>
        <td>Pontos de Poder (PP) do golpe</td>
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
  <p>A entidade <code>Metodo</code> representa os diferentes métodos pelos quais um Pokémon pode aprender um golpe. Isso pode incluir aprendizado por nível, TM/HM, tutor de golpes, entre outros.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do método de aprendizado</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição detalhada do método de aprendizado</td>
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
  <summary>PokeCenter</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>PokeCenter</code> representa os centros Pokémon onde os treinadores podem curar seus Pokémon, acessar o armazenamento de Pokémon e utilizar outros serviços.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do PokeCenter</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização do PokeCenter</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>servicos</code></td>
        <td>Texto</td>
        <td>Serviços oferecidos pelo PokeCenter</td>
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
  <summary>Ginasio</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Ginasio</code> representa os ginásios Pokémon onde os treinadores podem desafiar líderes de ginásio para ganhar insígnias. Cada ginásio é especializado em um tipo específico de Pokémon.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do ginásio</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização do ginásio</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_especializado</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo de Pokémon especializado</td>
        <td>Inteiro positivo (FK para <code>Tipos</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>lider_ginasio</code></td>
        <td>Texto</td>
        <td>Nome do líder do ginásio</td>
        <td>Texto (máx. 100 caracteres)</td>
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
  <p>A entidade <code>Inst_Pokemon</code> representa uma instância específica de um Pokémon pertencente a um treinador. Inclui informações como o nível, experiência, e status atual do Pokémon.</p>

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
        <td>Identificador único da instância do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nivel</code></td>
        <td>Inteiro</td>
        <td>Nível atual do Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>experiencia</code></td>
        <td>Inteiro</td>
        <td>Experiência acumulada pelo Pokémon</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior ou igual a 0</td>
      </tr>
      <tr>
        <td><code>status_atual</code></td>
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
  <p>A entidade <code>Time_Principal</code> representa o time principal de Pokémon de um treinador. Inclui informações sobre os Pokémon que fazem parte do time principal.</p>

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
        <td><code>time_principal_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do time principal</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>inst_pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da instância do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Inst_Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>posicao</code></td>
        <td>Inteiro</td>
        <td>Posição do Pokémon no time principal</td>
        <td>Inteiro positivo (1 a 6)</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser entre 1 e 6</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>Cidade</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Cidade</code> representa as diferentes cidades no mundo Pokémon. Cada cidade pode ter ginásios, PokeCenters e outras instalações importantes.</p>

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
        <td><code>cidade_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da cidade</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome da cidade</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição da cidade</td>
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
  <summary>Pokemon_Selvagem</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokemon_Selvagem</code> representa os Pokémon que podem ser encontrados na natureza, sem pertencer a nenhum treinador. Inclui informações sobre a localização e a frequência de aparição desses Pokémon.</p>

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
        <td><code>pokemon_selvagem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do Pokémon selvagem</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização onde o Pokémon selvagem pode ser encontrado</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>frequencia</code></td>
        <td>Decimal</td>
        <td>Frequência de aparição do Pokémon selvagem (0 a 1)</td>
        <td>Decimal entre 0 e 1</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser entre 0 e 1</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>Pokedex</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokedex</code> representa a enciclopédia digital que registra informações sobre todos os Pokémon que um treinador encontrou e capturou. Inclui detalhes como o nome, tipo, e descrição dos Pokémon.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do Pokémon</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>tipo_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do tipo do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Tipos</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição do Pokémon</td>
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
  <summary>Local</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Local</code> representa os diferentes locais no mundo Pokémon onde eventos podem ocorrer, como cidades, rotas, cavernas, etc. Inclui informações sobre o nome e a descrição do local.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do local</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição do local</td>
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
  <summary>Rota</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Rota</code> representa as diferentes rotas no mundo Pokémon que conectam cidades e outros locais. Inclui informações sobre o nome, a descrição e os Pokémon selvagens que podem ser encontrados na rota.</p>

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
        <td><code>rota_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da rota</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome da rota</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição da rota</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>pokemon_selvagens</code></td>
        <td>Texto</td>
        <td>Lista de Pokémon selvagens encontrados na rota</td>
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
  <summary>Caminho</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Caminho</code> representa as conexões entre diferentes locais no mundo Pokémon, como cidades e rotas. Inclui informações sobre os locais de origem e destino, bem como a distância entre eles.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>local_origem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local de origem</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>local_destino_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do local de destino</td>
        <td>Inteiro positivo (FK para <code>Local</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>distancia</code></td>
        <td>Decimal</td>
        <td>Distância entre os locais de origem e destino</td>
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
  <summary>Zona_de_captura</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Zona_de_captura</code> representa as áreas específicas onde os Pokémon podem ser capturados. Inclui informações sobre a localização e os tipos de Pokémon que podem ser encontrados nessas zonas.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome da zona de captura</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização da zona de captura</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>pokemon_selvagens</code></td>
        <td>Texto</td>
        <td>Lista de Pokémon selvagens encontrados na zona de captura</td>
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
  <summary>Pokémart</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokémart</code> representa as lojas onde os treinadores podem comprar itens como Pokébolas, poções e outros suprimentos. Inclui informações sobre a localização e os itens disponíveis para venda.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do Pokémart</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização do Pokémart</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>itens_disponiveis</code></td>
        <td>Texto</td>
        <td>Lista de itens disponíveis para venda</td>
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
  <summary>Time</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Time</code> representa um grupo de Pokémon que um treinador possui. Inclui informações sobre o treinador e os Pokémon que fazem parte do time.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>inst_pokemon_id</code></td>
        <td>Inteiro</td>
        <td>Identificador da instância do Pokémon</td>
        <td>Inteiro positivo (FK para <code>Inst_Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>posicao</code></td>
        <td>Inteiro</td>
        <td>Posição do Pokémon no time</td>
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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do treinador</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>idade</code></td>
        <td>Inteiro</td>
        <td>Idade do treinador</td>
        <td>Inteiro positivo</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Deve ser maior que 0 se não for nulo</td>
      </tr>
      <tr>
        <td><code>cidade_origem</code></td>
        <td>Texto</td>
        <td>Cidade de origem do treinador</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>insignias</code></td>
        <td>Inteiro</td>
        <td>Número de insígnias conquistadas pelo treinador</td>
        <td>Inteiro positivo</td>
        <td>Sim</td>
        <td>Não</td>
        <td>Deve ser maior ou igual a 0 se não for nulo</td>
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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>item_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do item</td>
        <td>Inteiro positivo (FK para <code>Item</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>quantidade</code></td>
        <td>Inteiro</td>
        <td>Quantidade do item na mochila</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior ou igual a 0</td>
      </tr>
    </tbody>
  </table>

</details>
---
<details>
  <summary>Item</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Item</code> representa os diferentes itens que podem ser encontrados e utilizados pelos treinadores no mundo Pokémon. Inclui informações sobre o nome, descrição e efeitos dos itens.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do item</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição do item</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>efeito</code></td>
        <td>Texto</td>
        <td>Efeito do item</td>
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
  <summary>Pokebola</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Pokebola</code> representa os diferentes tipos de Pokébolas usadas para capturar Pokémon. Inclui informações sobre o nome, descrição e taxa de captura das Pokébolas.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome da Pokébola</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição da Pokébola</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>taxa_de_captura</code></td>
        <td>Decimal</td>
        <td>Taxa de captura da Pokébola</td>
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
  <summary>Líder</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Líder</code> representa os líderes de ginásio no mundo Pokémon. Inclui informações sobre o nome, especialização e o ginásio que lideram.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do líder</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>especializacao</code></td>
        <td>Texto</td>
        <td>Especialização do líder (tipo de Pokémon)</td>
        <td>Texto (máx. 50 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>ginasio_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do ginásio que o líder lidera</td>
        <td>Inteiro positivo (FK para <code>Ginasio</code>)</td>
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
  <p>A entidade <code>NPC</code> representa os personagens não jogáveis (Non-Playable Characters) no mundo Pokémon. Inclui informações sobre o nome, função e localização dos NPCs.</p>

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
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do NPC</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>funcao</code></td>
        <td>Texto</td>
        <td>Função do NPC (ex.: vendedor, guia)</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>localizacao</code></td>
        <td>Texto</td>
        <td>Localização do NPC</td>
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
        <td><code>pc_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do PC</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>treinador_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do treinador</td>
        <td>Inteiro positivo (FK para <code>Treinador</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>capacidade</code></td>
        <td>Inteiro</td>
        <td>Capacidade de armazenamento do PC</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Não</td>
        <td>Deve ser maior que 0</td>
      </tr>
      <tr>
        <td><code>pokemon_armazenados</code></td>
        <td>Texto</td>
        <td>Lista de Pokémon armazenados no PC</td>
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
        <td><code>utilitario_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único do utilitário</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>nome</code></td>
        <td>Texto</td>
        <td>Nome do utilitário</td>
        <td>Texto (máx. 100 caracteres)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>descricao</code></td>
        <td>Texto</td>
        <td>Descrição do utilitário</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>efeito</code></td>
        <td>Texto</td>
        <td>Efeito do utilitário</td>
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
  <summary>Evolução</summary>

  <h3>Descrição</h3>
  <p>A entidade <code>Evolução</code> representa o processo pelo qual um Pokémon evolui para uma forma mais avançada. Inclui informações sobre o Pokémon de origem, o Pokémon evoluído e as condições necessárias para a evolução.</p>

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
        <td><code>evolucao_id</code></td>
        <td>Inteiro</td>
        <td>Identificador único da evolução</td>
        <td>Inteiro positivo</td>
        <td>Não</td>
        <td>Sim</td>
        <td>Gerado automaticamente (autoincremento)</td>
      </tr>
      <tr>
        <td><code>pokemon_origem_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon de origem</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>pokemon_evoluido_id</code></td>
        <td>Inteiro</td>
        <td>Identificador do Pokémon evoluído</td>
        <td>Inteiro positivo (FK para <code>Pokemon</code>)</td>
        <td>Não</td>
        <td>Não</td>
        <td></td>
      </tr>
      <tr>
        <td><code>condicao</code></td>
        <td>Texto</td>
        <td>Condição necessária para a evolução (ex.: nível, item)</td>
        <td>Texto (máx. 255 caracteres)</td>
        <td>Sim</td>
        <td>Não</td>
        <td></td>
      </tr>
    </tbody>
  </table>

</details>
---
