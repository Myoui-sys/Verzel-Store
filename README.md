# Teste Técnico de QA — Verzel Store

Este repositório reúne a análise de qualidade realizada na Verzel Store para o processo seletivo de QA Júnior. A avaliação contempla planejamento, cenários em Gherkin, execução manual e de API, testes exploratórios, registro de bugs, evidências e automação com Playwright.

## Ambiente avaliado

- Aplicação: [Verzel Store](https://verzel-store.qa-test-verzel-store.workers.dev/)
- Documentação: [regras e critérios de aceite](https://verzel-store.qa-test-verzel-store.workers.dev/documentacao)
- URL-base utilizada na API: `https://verzel-store.qa-test-verzel-store.workers.dev/api`
- Versão da aplicação: 2.3.0
- Sistema operacional: Windows
- Navegador: Google Chrome 155.0.8059.40 — 64 bits
- Node.js: 24.18.0
- Playwright: 1.64.0
- Data da execução: 10/10/2026

## Organização do repositório

```text
docs/
├── bugs/                    Relatórios dos defeitos encontrados
├── exploratorios/           Registros das sessões exploratórias
├── estrategia-de-testes.md  Escopo, abordagem, riscos e critérios
├── matriz-rastreabilidade.md
└── resultado-execucao.md    Resultado consolidado dos testes

features/                    Cenários documentados em Gherkin
tests/e2e/                   Testes automatizados com Playwright

evidencias/
├── manual/                  Evidências da interface
├── api/                     Evidências das requisições e respostas
├── exploratorios/           Evidências das sessões exploratórias
└── automacao/               Evidência da execução automatizada
```

Os arquivos Gherkin documentam os cenários e a rastreabilidade. A automação foi implementada diretamente com Playwright e TypeScript, sem executar os arquivos `.feature` por meio do Cucumber.

## Estratégia e cenários

- [Estratégia de testes](docs/estrategia-de-testes.md)
- [Matriz de rastreabilidade](docs/matriz-rastreabilidade.md)
- [Cenários de cupons](features/cupons.feature)
- [Cenários de frete](features/frete.feature)
- [Cenários de carrinho](features/carrinho.feature)
- [Cenários de API](features/api.feature)
- [Cenários de checkout](features/checkout.feature)
- [Resultado consolidado](docs/resultado-execucao.md)

Foram avaliados cupons, cálculos, frete, quantidade máxima por produto, arredondamento, checkout e endpoints documentados. Testes de carga, estresse, segurança, login, pagamento online e consulta de pedidos ficaram fora do escopo.

## Resultado geral

| Situação | Quantidade |
|---|---:|
| Cenários executados | 25 |
| Passaram | 23 |
| Falharam | 2 |
| Bloqueados | 0 |
| Não executados | 0 |

Foram encontrados dois defeitos:

- [BUG-CT-007 — Frete cobrado para subtotal exatamente igual a R$ 200,00](docs/bugs/BUG-CT-007.md)
- [BUG-CT-018 — API aceita quantidade superior ao limite de cinco unidades](docs/bugs/BUG-CT-018.md)

## Testes exploratórios

Foram realizadas três sessões de 20 minutos, sem identificação de novos defeitos além dos já registrados:

- [EXP-001 — Cupons](docs/exploratorios/EXP-001-cupons.md)
- [EXP-002 — Carrinho e frete](docs/exploratorios/EXP-002-carrinho-frete.md)
- [EXP-003 — Checkout](docs/exploratorios/EXP-003-checkout.md)

## Automação com Playwright

Foram automatizados três cenários prioritários no Chromium:

- CT-001 — aplicação de cupom válido;
- CT-003 — rejeição de cupom inexistente;
- CT-010 — manutenção do frete grátis após o desconto.

Código:

- [`tests/e2e/cupons.spec.ts`](tests/e2e/cupons.spec.ts)
- [`tests/e2e/frete.spec.ts`](tests/e2e/frete.spec.ts)

Evidência: [três testes aprovados no relatório do Playwright](evidencias/automacao/01-playwright-tres-testes-aprovados.png).

### Instalação

```bash
npm ci
npx playwright install chromium
```

### Execução

```bash
# Executar no Chromium
npm test

# Acompanhar a execução no navegador
npm run test:headed

# Abrir o último relatório HTML
npm run test:report
```

## Ambiguidades e ajustes realizados

- O link direto da API apresentado no material de apoio não carregou como esperado. A execução utilizou a URL-base confirmada na documentação web: `https://verzel-store.qa-test-verzel-store.workers.dev/api`.
- No CA05, a interface não permite digitar outro cupom enquanto existe um código ativo. Os CT-005 e CT-006 foram descritos conforme o fluxo observável: remover o cupom atual antes de informar outro.
- O CT-010 inicialmente utilizaria o limite exato de R$ 200,00. Após a descoberta do BUG-CT-007, os dados foram alterados para subtotal de R$ 219,80, isolando a regra de frete calculado antes do desconto.
- O CT-013 foi ajustado para validar o comportamento disponível ao usuário: quantidade mantida em cinco unidades, botão de adição desabilitado e mensagem de limite apresentada.
- Na automação, a validação inicial do CT-001 localizava o texto `R$ 239,70`, que aparecia simultaneamente no subtotal e no total. O seletor foi refinado para os atributos `data-valor`, identificando cada valor sem depender da posição na página.

Esses ajustes não alteraram os critérios de aceite. Eles tornaram as pré-condições, os dados e os resultados esperados mais específicos e independentes dos defeitos já conhecidos.

## Evidências

As evidências estão separadas por tipo e identificador:

- [`evidencias/manual`](evidencias/manual)
- [`evidencias/api`](evidencias/api)
- [`evidencias/exploratorios`](evidencias/exploratorios)
- [`evidencias/automacao`](evidencias/automacao)

## Uso de inteligência artificial

Foi utilizada IA generativa como apoio para estruturar a documentação, revisar a escrita dos cenários Gherkin, desenvolver e ajustar os testes Playwright e organizar as evidências. Os critérios, comportamentos observados, resultados e defeitos foram conferidos durante a execução no ambiente disponibilizado.

## Responsável

Dacyrrôse Melo
