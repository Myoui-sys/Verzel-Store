# language: pt

@carrinho
Funcionalidade: Gerenciamento dos produtos no carrinho
  Como cliente da Verzel Store
  Quero alterar as quantidades dos produtos
  Para controlar os itens e valores da minha compra

  @CT-012 @CA10 @limite @positivo
  Cenário: Manter cinco unidades do mesmo produto no carrinho
    Dado que adicionei o "Kit 3 Pares de Meias" ao carrinho
    Quando aumento a quantidade do produto para 5 unidades
    Então o carrinho deve permanecer com 5 unidades do produto
    E o subtotal deve ser de R$ 149,50
    E o frete deve ser de R$ 19,90
    E o total deve ser de R$ 169,40