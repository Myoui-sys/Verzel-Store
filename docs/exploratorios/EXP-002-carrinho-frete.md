# EXP-002 — Exploração do carrinho e frete

## Objetivo

Investigar a atualização das quantidades, dos valores do carrinho e do frete durante diferentes transições de estado, especialmente próximas ao limite de R$ 200,00.

## Informações da sessão

- Data: 10/10/2026
- Duração: 20 minutos
- Responsável: Dacyrrôse Melo
- Ambiente: Verzel Store 2.3.0
- Navegador: Google Chrome 155.0.8059.40 — 64 bits
- Status: Concluída

## Ações sugeridas

- Montar subtotal de R$ 199,80 com uma Mochila e dois Bonés.
- Verificar frete e valor faltante em R$ 199,80.
- Adicionar outro produto e ultrapassar R$ 200,00.
- Remover o produto e retornar para menos de R$ 200,00.
- Alterar várias vezes a quantidade usando os botões `+` e `-`.
- Remover um produto de um carrinho com vários itens.
- Conferir se o contador do cabeçalho acompanha o total de unidades.
- Atualizar a página com produtos no carrinho.
- Navegar para produtos e retornar ao carrinho.
- Esvaziar o carrinho e verificar a tela apresentada.

## Registro da exploração

| Ação realizada | Resultado observado | Evidência | Classificação |
|---|---|---|---|
| Tentativa de adicionar produtos pela vitrine após atingir cinco unidades | O botão de adição ficou desabilitado e a mensagem "Limite de 5 unidades atingido." foi apresentada | [Ver evidência](../../evidencias/exploratorios/EXP-002/01-limite-na-vitrine.png) | Esperado |
| Carrinho com uma Mochila e dois Bonés, totalizando R$ 199,80 | O sistema cobrou frete de R$ 19,90, informou que faltavam R$ 0,20 e apresentou total de R$ 219,70 | [Ver evidência](../../evidencias/exploratorios/EXP-002/02-subtotal-199-80-com-frete.png) | Esperado |
| Inclusão de outra Mochila, elevando o subtotal para R$ 299,80 | O sistema concedeu frete grátis e apresentou total de R$ 299,80 | [Ver evidência](../../evidencias/exploratorios/EXP-002/03-subtotal-acima-200-frete-gratis.png) | Esperado |
| Remoção de uma unidade para retornar ao subtotal inferior a R$ 200,00 | O frete de R$ 19,90 e o valor faltante voltaram a ser apresentados corretamente | [Ver evidência](../../evidencias/exploratorios/EXP-002/02-subtotal-199-80-com-frete.png) | Esperado |
| Aumento repetido da quantidade de dois produtos | Cada produto foi limitado a cinco unidades e os botões de adição ficaram desabilitados | [Ver evidência](../../evidencias/exploratorios/EXP-002/04-limite-e-contador-do-carrinho.png) | Esperado |
| Conferência do contador com cinco Mochilas e cinco Bonés | O cabeçalho apresentou corretamente o total de dez unidades | [Ver evidência](../../evidencias/exploratorios/EXP-002/04-limite-e-contador-do-carrinho.png) | Esperado |
| Atualização da página e navegação entre produtos e carrinho | Os produtos, quantidades e valores permaneceram preservados | - | Esperado |
| Esvaziamento do carrinho | Todos os itens foram removidos, o contador foi zerado e a tela de carrinho vazio foi apresentada | [Ver evidência](../../evidencias/exploratorios/EXP-002/05-carrinho-vazio.png) | Esperado |

## Descobertas

Os valores de frete foram atualizados corretamente ao atravessar o limite de R$ 200,00. Para o subtotal de R$ 199,80, o sistema cobrou R$ 19,90 de frete e informou corretamente que faltavam R$ 0,20. Ao elevar o subtotal para R$ 299,80, o frete passou a ser grátis.

O limite de cinco unidades foi respeitado tanto no carrinho quanto na vitrine. O contador do cabeçalho representou corretamente o total de unidades, e o estado do carrinho permaneceu após atualização da página e navegação.

## Bugs encontrados

Nenhum novo defeito foi identificado nesta sessão. O defeito já registrado como BUG-CT-007 não foi considerado um novo bug.

## Conclusão

As quantidades, o contador, os valores do carrinho e as transições de frete apresentaram comportamento consistente nos fluxos explorados. A sessão foi concluída sem novos defeitos.
