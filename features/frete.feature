# language: pt

@frete
Funcionalidade: Cálculo do frete
  Como cliente da Verzel Store
  Quero visualizar corretamente o valor do frete
  Para conhecer o valor total da minha compra

  @CT-007 @CA06 @limite
  Cenário: Conceder frete grátis para subtotal exatamente igual a R$ 200,00
    Dado que possuo 2 unidades da "Mochila Urbana 20L" no carrinho
    E o subtotal do carrinho é R$ 200,00
    Quando visualizo o resumo do carrinho
    Então o frete deve ser grátis
    E o valor faltante para frete grátis deve ser R$ 0,00
    E o total deve ser de R$ 200,00

    