# Resultado da Execução dos Testes

## Informações da execução

- Data de início: 10/10/2026
- Data de término:
- Sistema operacional: Windows
- Navegador: Google Chrome
- Versão do navegador: 155.0.8059.40 (Versão oficial) 64 bits
- Versão da aplicação: 2.3.0
- Responsável: Dacyrrôse Melo

## Status utilizados

- **Não executado:** o cenário ainda não foi testado.
- **Passou:** o comportamento observado corresponde ao esperado.
- **Falhou:** o comportamento observado é diferente do esperado.
- **Bloqueado:** não foi possível concluir a execução.

## Resultado dos cenários

| ID | Área | Status | Resultado obtido | Evidência | Bug |
|---|---|---|---|---|---|
| CT-001 | Cupom | Passou | Subtotal de R$ 239,70, desconto de R$ 23,97, frete grátis e total de R$ 215,73 | [Ver evidência](../evidencias/manual/CT-001/02-cupom-aplicado.png) | - |
| CT-002 | Cupom | Passou | Subtotal de R$ 100,00, desconto de R$ 10,00, frete de R$ 19,90 e total de R$ 109,90 | [Ver evidência](../evidencias/manual/CT-002/02-cupom-com-espaco-aplicado.png) | - |
| CT-003 | Cupom | Passou | Mensagem "Cupom inválido.", nenhum desconto aplicado, frete de R$ 19,90 e total de R$ 119,90 | [Ver evidência](../evidencias/manual/CT-003/02-cupom-invalido-aplicado.png) | - |
| CT-004 | Cupom | Passou | Mensagem "Cupom expirado.", nenhum desconto aplicado, frete de R$ 19,90 e total de R$ 119,90 | [Ver evidência](../evidencias/manual/CT-004/02-cupom-expirado-aplicado.png) | - |
| CT-005 | Cupom | Passou | Com o cupom BEMVINDO10 ativo, a interface não disponibilizou campo para informar outro cupom e manteve o desconto de R$ 10,00 | [Ver evidência](../evidencias/manual/CT-005/01-cupom-aplicado.png) | - |
| CT-006 | Cupom | Passou | Após a remoção do BEMVINDO10, o campo de cupom foi disponibilizado novamente. O código VERAO2026 foi validado como expirado, sem desconto, com frete de R$ 19,90 e total de R$ 119,90 | [Cupom removido](../evidencias/manual/CT-006/02-cupom-removido.png) / [Novo cupom validado](../evidencias/manual/CT-006/03-novo-cupom-aplicado.png) | - |
| CT-007 | Frete | Falhou | Com subtotal de R$ 200,00, o sistema cobrou frete de R$ 19,90, exibiu a mensagem "Faltam R$ 0,00 para o frete grátis" e apresentou total de R$ 219,90 | [Ver evidência](../evidencias/manual/CT-007/01-frete-cobrado-no-limite.png) | [BUG-CT-007](bugs/BUG-CT-007.md) |
| CT-008 | Frete | Passou | Para o subtotal de R$ 229,90, o sistema concedeu frete grátis, não exibiu valor faltante e apresentou total de R$ 229,90 | [Ver evidência](../evidencias/manual/CT-008/01-frete-gratis.png) | - |
| CT-009 | Frete | Passou | Para o subtotal de R$ 189,90, o sistema cobrou frete de R$ 19,90, informou que faltavam R$ 10,10 para o frete grátis e apresentou total de R$ 209,80 | [Ver evidência](../evidencias/manual/CT-009/01-cobranca-de-frete.png) | - |
| CT-010 | Frete | Passou | Com subtotal de R$ 219,80, o cupom aplicou desconto de R$ 21,98 e reduziu o total para R$ 197,82, mantendo o frete grátis | [Ver evidência](../evidencias/manual/CT-010/02-frete-gratis-apos-desconto.png) | - |
| CT-011 | Frete | Passou | Para o subtotal de R$ 100,00, o cupom aplicou desconto de R$ 10,00 somente sobre os produtos, manteve o frete em R$ 19,90 e apresentou total de R$ 109,90 | [Ver evidência](../evidencias/manual/CT-011/02-desconto-nao-aplicado-ao-frete.png) | - |
| CT-012 | Carrinho | Passou | O sistema permitiu 5 unidades do produto, apresentou subtotal de R$ 149,50, frete de R$ 19,90 e total de R$ 169,40 | [Ver evidência](../evidencias/manual/CT-012/02-limite-atendido.png) | - |
| CT-013 | Carrinho | Passou | Ao atingir 5 unidades, o sistema desabilitou a adição de novas unidades, exibiu a mensagem "Limite de 5 unidades por produto." e manteve o subtotal em R$ 149,50 | [Ver evidência](../evidencias/manual/CT-013/01-limite-cinco-unidades.png) | - |
| CT-014 | Carrinho | Passou | O sistema apresentou subtotal de R$ 179,70, desconto de R$ 17,97, frete de R$ 19,90, total de R$ 181,63 e todos os valores monetários com duas casas decimais | [Ver evidência](../evidencias/manual/CT-014/02-cupom-aplicado-decimal.png) | - |
| CT-015 | API | Passou | A API respondeu com status 200 e retornou uma lista de produtos contendo os campos id, nome, descrição, categoria e preço | [Ver evidência](../evidencias/api/CT-015/01-listagem-produtos-status-200.png) | - |
| CT-016 | API | Passou | A API respondeu com status 200, subtotal de 239.70, desconto de 23.97, frete zero, total de 215.73 e cupom BEMVINDO10 marcado como aplicado | [Ver evidência](../evidencias/api/CT-016/01-calculo-cupom-valido.png) | - |
| CT-017 | API | Passou | A API respondeu com status 200, manteve o desconto em zero e retornou o cupom CUPOMINVALIDO como não aplicado, com a mensagem "Cupom inválido." | [Ver evidência](../evidencias/api/CT-017/01-calculo-cupom-invalido.png) | - |
| CT-018 | API | Falhou | A API aceitou 6 unidades do produto, respondeu com status 200 e calculou o carrinho, em vez de retornar status 422 e o código QUANTIDADE_MAXIMA_EXCEDIDA | [Ver evidência](../evidencias/api/CT-018/01-api-aceita-quantidade-acima-limite.png) | [BUG-CT-018](bugs/BUG-CT-018.md) |
| CT-019 | API | Passou | A API respondeu com status 201, gerou o pedido VZ-140744 e retornou subtotal de 100.00, desconto de 10.00, frete de 19.90 e total de 109.90 | [Ver evidência](../evidencias/api/CT-019/01-pedido-valido-confirmado.png) | - |
| CT-020 | API | Passou | A API rejeitou a criação do pedido com cupom inválido, respondendo com status 422 e código CUPOM_INVALIDO | [Ver evidência](../evidencias/api/CT-020/01-pedido-cupom-invalido.png) | - |
| CT-021 | Checkout | Passou | O pedido foi confirmado com dados válidos, apresentou número no formato VZ-000000 e não solicitou pagamento online | [Ver evidência](../evidencias/manual/CT-021/02-pedido-confirmado.png) | - |
| CT-022 | Checkout | Passou | O sistema aceitou o CEP 01310100 sem hífen e confirmou o pedido normalmente | [Ver evidência](../evidencias/manual/CT-022/02-pedido-confirmado.png) | - |
| CT-023 | Checkout | Passou | O sistema impediu a confirmação do pedido com o nome "Maria", permaneceu no checkout e indicou que o campo de nome era inválido | [Ver evidência](../evidencias/manual/CT-023/01-nome-sem-sobrenome-rejeitado.png) | - |
| CT-024 | Checkout | Passou | O sistema impediu a confirmação do pedido com o e-mail "maria@", permaneceu no checkout e indicou que o campo de e-mail era inválido | [Ver evidência](../evidencias/manual/CT-024/01-email-invalido-rejeitado.png) | - |
| CT-025 | Checkout | Passou | O sistema impediu a confirmação do pedido com o CEP "01310-10", permaneceu no checkout e indicou que o campo de CEP era inválido | [Ver evidência](../evidencias/manual/CT-025/01-cep-invalido-rejeitado.png) | - |

## Resumo

| Situação | Quantidade |
|---|---:|
| Total de cenários | 25 |
| Passou | 23 |
| Falhou | 2 |
| Bloqueado | 0 |
| Não executado | 0 |

## Observações gerais

Todos os 25 cenários planejados foram executados. Foram identificados dois defeitos: cobrança de frete no limite exato de R$ 200,00 e ausência de validação do limite de cinco unidades na API. Nenhum cenário ficou bloqueado.

## Resultado da automação

Os cenários CT-001, CT-003 e CT-010 foram automatizados com Playwright e executados no projeto Chromium.

| ID | Cenário automatizado | Arquivo | Status |
|---|---|---|---|
| CT-001 | Aplicar cupom válido sobre o subtotal | `tests/e2e/cupons.spec.ts` | Passou |
| CT-003 | Rejeitar cupom inexistente | `tests/e2e/cupons.spec.ts` | Passou |
| CT-010 | Manter o frete grátis após o desconto | `tests/e2e/frete.spec.ts` | Passou |

[Evidência da execução automatizada](../evidencias/automacao/01-playwright-tres-testes-aprovados.png)