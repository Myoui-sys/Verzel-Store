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

    