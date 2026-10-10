# EXP-001 — Exploração de cupons

## Objetivo

Investigar o comportamento dos cupons durante alterações de estado do carrinho e entradas não convencionais.

## Informações da sessão

- Data: 10/10/2026
- Duração: 20 minutos
- Responsável: Dacyrrôse Melo
- Ambiente: Verzel Store 2.3.0
- Navegador: Google Chrome 155.0.8059.40 — 64 bits
- Status: Concluída

## Ações sugeridas

- Aplicar cupom com o campo vazio.
- Aplicar um código formado apenas por espaços.
- Aplicar código muito longo ou com caracteres especiais.
- Alterar quantidades depois de aplicar o BEMVINDO10.
- Remover um produto enquanto o cupom está ativo.
- Remover todos os produtos enquanto o cupom está ativo.
- Atualizar a página depois de aplicar o cupom.
- Remover e reaplicar o cupom.
- Navegar para produtos e voltar ao carrinho.
- Clicar mais de uma vez rapidamente no botão de aplicação.

## Registro da exploração

| Ação realizada | Resultado observado | Evidência | Classificação |
|---|---|---|---|
| Tentativa de aplicar cupom com o campo vazio | O cupom não foi aplicado e a mensagem "Informe um cupom." foi apresentada | [Ver evidência](../../evidencias/exploratorios/EXP-001/01-campo-vazio.png) | Esperado |
| Aplicação do código "BEM VINDO 10", contendo espaços internos | O código não foi aceito e a mensagem "Cupom inválido." foi apresentada | [Ver evidência](../../evidencias/exploratorios/EXP-001/02-cupom-com-espacos-internos.png) | Esperado |
| Aumento da quantidade com o cupom BEMVINDO10 ativo | O subtotal, o desconto de 10% e o total foram recalculados corretamente | [Ver evidência](../../evidencias/exploratorios/EXP-001/03-desconto-apos-aumentar-quantidade.png) | Esperado |
| Novo aumento da quantidade com o cupom ativo | O desconto acompanhou o novo subtotal e os valores permaneceram consistentes | [Ver evidência](../../evidencias/exploratorios/EXP-001/04-novo-recalculo-do-desconto.png) | Esperado |
| Esvaziamento do carrinho enquanto havia um cupom ativo | O carrinho foi esvaziado e o cupom deixou de permanecer ativo | [Ver evidência](../../evidencias/exploratorios/EXP-001/05-carrinho-esvaziado.png) | Esperado |
| Inclusão de produtos após alterações no carrinho | O subtotal, o desconto, o frete e o total foram recalculados corretamente | [Ver evidência](../../evidencias/exploratorios/EXP-001/06-recalculo-com-varios-produtos.png) | Esperado |
| Atualização da página com o cupom BEMVINDO10 ativo | O cupom permaneceu aplicado e os valores foram mantidos | - | Esperado |
| Remoção de um dos produtos com outros itens no carrinho | O cupom permaneceu ativo e o desconto foi recalculado sobre o novo subtotal | - | Esperado |
| Remoção e reaplicação do BEMVINDO10 | O cupom foi removido e pôde ser aplicado novamente normalmente | - | Esperado |
| Navegação para a página de produtos e retorno ao carrinho | Os produtos e o cupom permaneceram no carrinho | - | Esperado |

## Descobertas

A aplicação tratou corretamente o campo vazio e códigos com espaços internos. O desconto foi recalculado após alterações de quantidade e remoção de produtos.

O cupom permaneceu ativo após a atualização da página, durante a navegação entre produtos e carrinho e enquanto ainda existiam produtos no carrinho. Quando o carrinho foi completamente esvaziado, o cupom foi removido e não foi reaplicado automaticamente aos produtos adicionados posteriormente.

## Bugs encontrados

Nenhum novo defeito foi identificado nesta sessão.

## Conclusão

A aplicação apresentou comportamento consistente na validação, aplicação, remoção e persistência do cupom. Os valores foram recalculados corretamente após alterações no carrinho. A sessão foi concluída sem novos defeitos.
