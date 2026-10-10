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
| CT-006 | Cupom | Não executado | Passou | - | - |
| CT-007 | Frete | Não executado | - | - | - |
| CT-008 | Frete | Não executado | - | - | - |
| CT-009 | Frete | Não executado | - | - | - |
| CT-010 | Frete | Não executado | - | - | - |
| CT-011 | Frete | Não executado | - | - | - |
| CT-012 | Carrinho | Não executado | - | - | - |
| CT-013 | Carrinho | Não executado | - | - | - |
| CT-014 | Carrinho | Não executado | - | - | - |
| CT-015 | API | Não executado | - | - | - |
| CT-016 | API | Não executado | - | - | - |
| CT-017 | API | Não executado | - | - | - |
| CT-018 | API | Não executado | - | - | - |
| CT-019 | API | Não executado | - | - | - |
| CT-020 | API | Não executado | - | - | - |
| CT-021 | Checkout | Não executado | - | - | - |
| CT-022 | Checkout | Não executado | - | - | - |
| CT-023 | Checkout | Não executado | - | - | - |
| CT-024 | Checkout | Não executado | - | - | - |
| CT-025 | Checkout | Não executado | - | - | - |

## Resumo

| Situação | Quantidade |
|---|---:|
| Total planejado | 25 |
| Passou | 6 |
| Falhou | 0 |
| Bloqueado | 0 |
| Não executado | 19 |

## Observações gerais

Preencher ao final da execução.