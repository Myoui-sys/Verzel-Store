# Estratégia de Testes da Loja Verzel

## 1. Objetivo

Validar a implementação de cupons de desconto e frete grátis da Verzel Store, verificando se os critérios de aceite e as regras de negócio apresentados na documentação foram atendidos.

A avaliação será realizada por meio de testes manuais, exploratórios, de API e automatizados com Playwright.

Os cenários detalhados estarão na pasta `features/`, relacionados aos critérios de aceite em `docs/matriz-rastreabilidade.md`.

## 2. Escopo

Serão validados:

- Aplicação de cupom válido.
- Normalização do cupom quanto a letras maiúsculas, minúsculas e espaços externos.
- Tratamento de cupom inválido e expirado.
- Remoção de cupom e tentativa de aplicação de outro cupom.
- Cálculos de subtotal, desconto, frete e total.
- Frete grátis para subtotal igual ou superior ao limite estabelecido.
- Interação entre desconto e frete.
- Atualização dos valores após alterações no carrinho.
- Limite de quantidade por produto.
- Arredondamento e apresentação dos valores monetários.
- Validações básicas dos dados do cliente.
- Confirmação do pedido.
- Mensagens e valores apresentados na interface.
- Respostas e validações dos endpoints documentados.

## 3. Fora do escopo

Conforme o enunciado, não serão realizados:

- Testes de carga.
- Testes de estresse.
- Testes de segurança.

Também não fazem parte do planejamento os testes de login, cadastro de clientes, pagamento online e consulta de pedidos. Essa delimitação será conferida com as funcionalidades e simplificações descritas na documentação do ambiente.

## 4. Abordagem de testes

### 4.1. Testes manuais

Os cenários serão executados conforme suas pré-condições, dados de entrada e resultados esperados.

Serão utilizados testes positivos, negativos e de valores-limite, considerando principalmente:

- Aplicação e rejeição de cupons.
- Subtotais abaixo, iguais e acima de R$ 200,00.
- Quantidade máxima de cinco unidades por produto e tentativa de inclusão da sexta unidade.
- Alterações no carrinho após a aplicação de um cupom.
- Dados válidos e inválidos no checkout.

Os valores e limites serão conferidos com a documentação antes da execução.

### 4.2. Testes de API

Serão verificados os códigos de resposta, campos relevantes, mensagens de erro e cálculos retornados pelos endpoints documentados.

Quando aplicável, serão comparados os resultados da API e da interface utilizando os mesmos dados de entrada.

### 4.3. Testes exploratórios

Serão realizadas sessões de aproximadamente 20 a 30 minutos, orientadas pelos seguintes objetivos:

| Área | Objetivo da exploração |
| --- | --- |
| Cupons | Investigar aplicação, remoção, normalização e tentativa de troca de cupom. |
| Carrinho e frete | Investigar a atualização dos valores ao alterar quantidades, remover produtos e atravessar o limite de frete grátis. |
| Checkout | Investigar preenchimento, correção de dados inválidos e confirmação do pedido. |

Cada sessão terá registro de:

- Objetivo.
- Data e duração.
- Ambiente utilizado.
- Ações relevantes.
- Comportamentos observados.
- Evidências.
- Bugs encontrados e pendências.

Novos casos relevantes identificados durante a exploração poderão ser incorporados aos cenários documentados.

### 4.4. Testes automatizados

Serão automatizados pelo menos três cenários da loja com Playwright, priorizando as regras centrais da entrega.

A seleção inicial será:

| Cenário | Descrição |
| --- | --- |
| CT-001 | Aplicação de cupom válido sobre o subtotal. |
| CT-003 | Tentativa de aplicação de cupom inexistente. |
| CT-010 | Manutenção do frete grátis quando o desconto reduz o total abaixo de R$ 200,00. |

Cada teste deverá preparar seu estado inicial e verificar os resultados esperados.

A seleção poderá ser ajustada após a execução manual, com a justificativa registrada.

## 5. Priorização

A execução começará por cupons, cálculos e frete, por serem o foco da entrega e afetarem diretamente o valor da compra.

Em seguida, serão avaliadas as alterações no carrinho, as validações do checkout e a confirmação do pedido.

Os testes de API acompanharão a prioridade da regra de negócio verificada.

## 6. Ambiente

| Item | Informação |
| --- | --- |
| Aplicação | [Verzel Store](https://verzel-store.qa-test-verzel-store.workers.dev/) |
| Documentação | [Documentação da entrega](https://verzel-store.qa-test-verzel-store.workers.dev/documentacao) |
| Documentação da API | [Documentação dos endpoints](https://verzel-store.qa-test-verzel-store.workers.dev/documentacao#api) |
| URL-base da API | https://verzel-store.qa-test-verzel-store.workers.dev/api |
| Versão da aplicação | 2.3.0 |
| Sistema operacional | Windows; registrar a versão utilizada. |
| Navegador e versão | Preencher durante a execução. |
| Versão do Node.js | Registrar na execução da automação. |
| Versão do Playwright | Registrar na execução da automação. |
| Datas de início e término | Preencher durante a execução. |

## 7. Dados de teste e preparação

Serão utilizados produtos, preços, identificadores e cupons conferidos na documentação da aplicação.

Cada cenário deverá informar os produtos, as quantidades, o cupom e os dados de cliente necessários. Serão utilizados dados fictícios de cliente.

Antes de cada teste, o carrinho será preparado conforme as pré-condições, removendo produtos e cupons de execuções anteriores quando necessário.

Para verificar o arredondamento, serão buscados dados que produzam valores com mais de duas casas decimais antes do arredondamento, quando isso for possível com as regras e o catálogo disponíveis.

## 8. Critérios para início

- Ambiente disponível.
- Documentação acessível e revisada, incluindo a seção "Sobre este ambiente".
- Critérios de aceite identificados.
- Cenários com pré-condições e resultados esperados definidos.
- Dados de teste disponíveis.
- Ambiente de execução identificado.

## 9. Registro de resultados, evidências e bugs

### 9.1. Resultados

O resultado de cada cenário será registrado em `docs/resultado-execucao.md`, utilizando os seguintes status:

| Status | Significado |
| --- | --- |
| Não executado | O cenário ainda não foi testado. |
| Passou | O comportamento observado corresponde ao esperado. |
| Falhou | O comportamento observado diverge do esperado. |
| Bloqueado | Uma condição impediu a conclusão do teste. |

Cada registro deverá apresentar o resultado obtido e a referência da evidência. Quando houver defeito, também será informado o identificador do bug.

### 9.2. Evidências

As evidências serão organizadas pelo identificador do cenário ou da sessão exploratória e poderão incluir:

- Capturas de tela.
- Registros de requisições e respostas.
- Relatórios da automação.

As evidências deverão permitir compreender o comportamento observado e permanecer acessíveis no repositório.

### 9.3. Bugs

Os bugs serão documentados com:

- Identificador e título.
- Ambiente.
- Cenário relacionado.
- Pré-condições.
- Dados utilizados.
- Passos para reprodução.
- Resultado esperado.
- Resultado obtido.
- Impacto e severidade justificada.
- Evidências.

Antes do registro, será verificado se o comportamento contradiz a documentação ou corresponde a uma simplificação prevista.

## 10. Critérios para conclusão

- Todos os critérios de aceite possuem pelo menos um cenário relacionado.
- Os cenários planejados foram executados; eventuais bloqueios ou casos não executados estão identificados e justificados.
- As sessões exploratórias foram realizadas e registradas.
- Resultados e evidências foram documentados.
- Todos os bugs encontrados foram reportados.
- Pelo menos três cenários da loja foram automatizados com Playwright e tiveram seus resultados registrados.
- O README explica como executar a automação e localizar cada entrega.
- As entregas estão reunidas em um único repositório público no GitHub.

A conclusão da avaliação não depende de todos os testes passarem. Falhas, bloqueios e limitações deverão ser apresentados no relatório final.

## 11. Riscos principais

Os principais riscos funcionais são:

- Cálculos incorretos de subtotal, desconto, frete ou total.
- Erros nos limites de R$ 200,00 e cinco unidades.
- Diferenças entre o comportamento da interface e da API.
- Problemas de arredondamento.
- Tratamento incorreto de espaços e letras minúsculas nos cupons.
- Mensagens de erro diferentes das especificadas.
- Valores desatualizados após alterações no carrinho.

Indisponibilidade do ambiente, mudanças nos dados e limitações de tempo poderão afetar a execução. Nesses casos, serão registrados os impactos e priorizados os cenários centrais da entrega.

## 12. Premissas e ambiguidades

Os comportamentos descritos como simplificações na seção "Sobre este ambiente" serão considerados esperados e não serão reportados como bugs.

Eventuais ambiguidades serão registradas junto da interpretação adotada durante os testes.

Os resultados representarão apenas os cenários, ambientes e condições efetivamente avaliados.