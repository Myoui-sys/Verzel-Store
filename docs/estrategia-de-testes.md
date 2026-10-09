# Estratégia de Testes da Loja Verzel

## 1. Objetivo

Validar a implementação de cupons de desconto e frete grátis da Verzel Store,
verificando se os critérios de aceite e as regras de negócio apresentados na
documentação foram atendidos.

## 2. Escopo

Serão validados:

- Aplicação de cupom válido;
- Tratamento de cupom inválido;
- Tratamento de cupom expirado;
- Remoção e troca de cupom;
- Cálculo do desconto;
- Cálculo do frete;
- Limite de quantidade por produto;
- Arredondamento dos valores;
- Validações básicas do cliente;
- Comportamento da interface;
- Respostas e validações da API.

## 3. Fora do escopo

Conforme a documentação do desafio, não serão realizados:

- Testes de login;
- Testes de cadastro de clientes;
- Testes de pagamento online;
- Testes de consulta de pedidos;
- Testes de carga;
- Testes de estresse;
- Testes de segurança.

## 4. Tipos de teste

- Testes funcionais;
- Testes negativos;
- Testes de valores-limite;
- Testes de API;
- Testes exploratórios;
- Testes automatizados com Playwright.

## 5. Ambiente

- Aplicação: https://verzel-store.qa-test-verzel-store.workers.dev/
- Documentação: https://verzel-store.qa-test-verzel-store.workers.dev/documentacao
- Documentação da API: https://verzel-store.qa-test-verzel-store.workers.dev/documentacao#api
- URL-base da API: https://verzel-store.qa-test-verzel-store.workers.dev/api
- Versão da aplicação: 2.3.0
- Sistema operacional: Windows
- Navegador: preencher durante a execução
- Data da execução: preencher durante a execução

## 6. Critérios para início

- Ambiente disponível;
- Documentação acessível;
- Critérios de aceite identificados;
- Dados de teste disponíveis.

## 7. Critérios para conclusão

- Todos os critérios de aceite possuem pelo menos um cenário;
- Cenários planejados foram executados;
- Resultados e evidências foram registrados;
- Bugs encontrados foram documentados;
- Pelo menos três cenários foram automatizados;
- README contém as instruções necessárias para avaliar o projeto.

## 8. Riscos principais

- Cálculos incorretos de subtotal, desconto, frete ou total;
- Erros nos limites de R$ 200,00 e cinco unidades;
- Diferenças entre o comportamento da interface e da API;
- Problemas de arredondamento;
- Cupom tratado incorretamente por causa de espaços ou letras minúsculas;
- Mensagens de erro diferentes das especificadas.

## 9. Premissas

Os comportamentos descritos na seção "Sobre este ambiente" são considerados
esperados e não serão reportados como bugs.

Eventuais ambiguidades encontradas serão registradas junto da interpretação
adotada durante os testes.