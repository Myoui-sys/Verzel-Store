# BUG-CT-007 — Frete cobrado para subtotal exatamente igual a R$ 200,00

## Status

Aberto

## Severidade

Alta

## Prioridade

Alta

## Critério e cenário relacionados

- Critério: CA06
- Cenário: CT-007

## Ambiente

- Aplicação: Verzel Store
- Versão: 2.3.0
- Sistema operacional: Windows
- Navegador: Google Chrome 155.0.8059.40 — 64 bits
- Data: 10/10/2026

## Pré-condições

- Carrinho vazio.
- Nenhum cupom aplicado.

## Dados utilizados

- Produto: Mochila Urbana 20L
- Preço unitário: R$ 100,00
- Quantidade: 2

## Passos para reprodução

1. Acessar a Verzel Store.
2. Adicionar a Mochila Urbana 20L ao carrinho.
3. Acessar o carrinho.
4. Aumentar a quantidade do produto para 2.
5. Observar o resumo do pedido.

## Resultado esperado

Para o subtotal de R$ 200,00, o frete deve ser grátis e o total deve permanecer em R$ 200,00.

## Resultado obtido

O sistema cobrou frete de R$ 19,90 e apresentou o total de R$ 219,90.

Além disso, a interface apresentou a mensagem “Faltam R$ 0,00 para o frete grátis”, indicando uma inconsistência entre a mensagem e o cálculo do frete.

## Impacto

O cliente pode ser cobrado indevidamente pelo frete mesmo atendendo ao valor mínimo documentado. O problema afeta uma regra central da entrega e altera o valor final da compra.

## Evidência

[Ver evidência](../../evidencias/manual/CT-007/01-frete-cobrado-no-limite.png)