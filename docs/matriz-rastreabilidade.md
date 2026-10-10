# Matriz de Rastreabilidade

| Critério | Descrição resumida | Cenários relacionados | Status |
|---|---|---|---|
| CA01 | Cupom aplica 10% sobre o subtotal | CT-001, CT-016 | Passou |
| CA02 | Cupom ignora caixa e espaços externos | CT-002 | Passou |
| CA03 | Cupom inexistente | CT-003, CT-017, CT-020 | Passou |
| CA04 | Cupom expirado | CT-004 | Passou |
| CA05 | Apenas um cupom por vez | CT-005, CT-006 | Passou |
| CA06 | Frete grátis a partir de R$ 200,00 | CT-007, CT-008 | Falhou |
| CA07 | Frete de R$ 19,90 abaixo de R$ 200,00 | CT-009 | Passou |
| CA08 | Frete considera subtotal antes do desconto | CT-010 | Passou |
| CA09 | Desconto não incide sobre o frete | CT-011 | Passou |
| CA10 | Máximo de cinco unidades por produto | CT-012, CT-013, CT-018 | Falhou |
| CA11 | Valores arredondados para duas casas | CT-014 | Passou |
| API-01 | Listagem de produtos | CT-015 | Passou |
| API-02 | Confirmação de pedido válido | CT-019 | Passou |
| RN-01 | Cliente deve informar nome e sobrenome | CT-021, CT-023 | Passou |
| RN-02 | Cliente deve informar e-mail válido | CT-021, CT-024 | Passou |
| RN-03 | CEP deve possuir 8 dígitos, com ou sem hífen | CT-021, CT-022, CT-025 | Passou |
| RN-04 | Pagamento é realizado na entrega | CT-021 | Passou |
