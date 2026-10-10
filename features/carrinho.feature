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

  @CT-013 @CA10 @limite @negativo
  Cenário: Tentar adicionar uma sexta unidade do mesmo produto
    Dado que possuo 5 unidades do "Kit 3 Pares de Meias" no carrinho
    Quando tento adicionar mais 1 unidade do mesmo produto
    Então a quantidade do produto não deve ultrapassar 5 unidades
    E deve ser exibida a mensagem "Limite de 5 unidades por produto."
    E o subtotal deve permanecer em R$ 149,50

  @CT-014 @CA11 @calculo
  Cenário: Apresentar os valores monetários com duas casas decimais
    Dado que possuo 3 unidades da "Camiseta Essencial" no carrinho
    E o subtotal do carrinho é R$ 179,70
    Quando aplico o cupom "BEMVINDO10"
    Então o desconto deve ser de R$ 17,97
    E o frete deve ser de R$ 19,90
    E o total deve ser de R$ 181,63
    E todos os valores monetários devem ser apresentados com duas casas decimais