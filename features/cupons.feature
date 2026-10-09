# language: pt

@cupons
Funcionalidade: Aplicação de cupons no carrinho
  Como cliente da Verzel Store
  Quero aplicar cupons no meu carrinho
  Para obter descontos nas minhas compras

  @CT-001 @CA01 @positivo
  Cenário: Aplicar cupom válido sobre o subtotal
    Dado que possuo 1 unidade da "Calça Jeans Slim" no carrinho
    E possuo 2 unidades do "Boné Aba Curva" no carrinho
    E o subtotal do carrinho é R$ 239,70
    Quando aplico o cupom "BEMVINDO10"
    Então o desconto deve ser de R$ 23,97
    E o frete deve ser grátis
    E o total deve ser de R$ 215,73

  @CT-002 @CA02 @positivo
  Cenário: Aplicar cupom ignorando caixa e espaços externos
    Dado que possuo 1 unidade da "Mochila Urbana 20L" no carrinho
    Quando aplico o cupom "  bemvindo10  "
    Então o cupom deve ser aceito
    E o desconto deve ser de R$ 10,00
    E o total deve ser de R$ 109,90

  @CT-003 @CA03 @negativo
  Cenário: Tentar aplicar um cupom inexistente
    Dado que possuo 1 unidade da "Mochila Urbana 20L" no carrinho
    Quando aplico o cupom "CUPOMINVALIDO"
    Então deve ser exibida a mensagem "Cupom inválido."
    E nenhum desconto deve ser aplicado
    E o total deve ser de R$ 119,90

    