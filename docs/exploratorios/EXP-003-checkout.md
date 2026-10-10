# EXP-003 — Exploração do checkout

## Objetivo

Investigar as validações dos dados do cliente, a correção de campos inválidos e o comportamento da confirmação do pedido.

## Informações da sessão

- Data: 10/10/2026
- Duração: 20 minutos
- Responsável: Dacyrrôse Melo
- Ambiente: Verzel Store 2.3.0
- Navegador: Google Chrome 155.0.8059.40 — 64 bits
- Status: Concluída

## Ações exploradas

- Tentar confirmar o pedido com todos os campos vazios.
- Corrigir os campos depois da apresentação dos erros.
- Informar nome com espaços externos.
- Informar nome com vários espaços entre nome e sobrenome.
- Informar e-mail com letras maiúsculas.
- Informar CEP válido sem hífen.
- Atualizar a página durante o checkout.
- Voltar ao carrinho e retornar ao checkout.
- Conferir se resumo, desconto, frete e total permanecem corretos.
- Confirmar o pedido com cupom aplicado.
- Verificar o número apresentado na confirmação.
- Verificar que não existe etapa de pagamento online.

## Registro da exploração

| Ação realizada | Resultado observado | Evidência | Classificação |
|---|---|---|---|
| Tentativa de confirmar o pedido com todos os campos vazios | O pedido não foi confirmado e foram exibidas mensagens obrigatórias para nome, e-mail e CEP | [Ver evidência](../../evidencias/exploratorios/EXP-003/01-validacao-campos-vazios.png) | Esperado |
| Acesso ao checkout com o cupom BEMVINDO10 aplicado | O resumo manteve subtotal de R$ 100,00, desconto de R$ 10,00, frete de R$ 19,90 e total de R$ 109,90 | [Ver evidência](../../evidencias/exploratorios/EXP-003/02-checkout-com-cupom-aplicado.png) | Esperado |
| Atualização da página durante o checkout | O produto, o cupom e os valores do resumo permaneceram preservados | - | Esperado |
| Retorno ao carrinho e novo acesso ao checkout | O subtotal, o desconto, o frete e o total permaneceram corretos | [Ver evidência](../../evidencias/exploratorios/EXP-003/02-checkout-com-cupom-aplicado.png) | Esperado |
| Correção dos campos utilizando nome com espaços, e-mail em letras maiúsculas e CEP sem hífen | Os valores foram aceitos e o formulário ficou disponível para confirmação | [Ver evidência](../../evidencias/exploratorios/EXP-003/03-dados-corrigidos-e-resumo-preservado.png) | Esperado |
| Confirmação do pedido com dados válidos e cupom BEMVINDO10 aplicado | O pedido foi confirmado e manteve subtotal de R$ 100,00, desconto de R$ 10,00, frete de R$ 19,90 e total de R$ 109,90 | [Ver evidência](../../evidencias/exploratorios/EXP-003/04-pedido-confirmado.png) | Esperado |
| Verificação do número apresentado na confirmação | Foi gerado o número VZ-840925, correspondente ao formato documentado VZ-000000 | [Ver evidência](../../evidencias/exploratorios/EXP-003/04-pedido-confirmado.png) | Esperado |
| Verificação da forma de pagamento | Não houve etapa de pagamento online e a confirmação informou que o pagamento será feito na entrega | [Ver evidência](../../evidencias/exploratorios/EXP-003/04-pedido-confirmado.png) | Esperado |
| Verificação do carrinho após a confirmação | O contador do carrinho foi zerado após o registro do pedido | [Ver evidência](../../evidencias/exploratorios/EXP-003/04-pedido-confirmado.png) | Esperado |

## Descobertas

O checkout impediu corretamente a confirmação com campos vazios e permitiu a correção dos dados. O nome com espaços, o e-mail em letras maiúsculas e o CEP sem hífen foram aceitos.

O produto, o cupom e os valores do resumo permaneceram após atualização da página e navegação entre checkout e carrinho. Na confirmação, foi gerado o pedido VZ-840925, o pagamento permaneceu definido para a entrega e o carrinho foi zerado.

## Bugs encontrados

Nenhum novo defeito foi identificado nesta sessão.

## Conclusão

As validações, a preservação do estado do carrinho e a confirmação do pedido apresentaram comportamento consistente nos fluxos explorados. A sessão foi concluída sem novos defeitos.
