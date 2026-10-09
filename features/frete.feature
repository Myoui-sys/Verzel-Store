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

  @CT-008 @CA06 @positivo
  Cenário: Conceder frete grátis para subtotal superior a R$ 200,00
    Dado que possuo 1 unidade da "Jaqueta Corta-Vento" no carrinho
    E o subtotal do carrinho é R$ 229,90
    Quando visualizo o resumo do carrinho
    Então o frete deve ser grátis
    E o valor faltante para frete grátis deve ser R$ 0,00
    E o total deve ser de R$ 229,90

  @CT-009 @CA07 @limite
  Cenário: Cobrar frete para subtotal abaixo de R$ 200,00
    Dado que possuo 1 unidade do "Tênis Casual Urbano" no carrinho
    E o subtotal do carrinho é R$ 189,90
    Quando visualizo o resumo do carrinho
    Então o frete deve ser de R$ 19,90
    E deve ser informado que faltam R$ 10,10 para o frete grátis
    E o total deve ser de R$ 209,80

  @CT-010 @CA08 @regra-de-negocio
  Cenário: Manter frete grátis quando o desconto reduz o total abaixo de R$ 200,00
    Dado que possuo 2 unidades da "Mochila Urbana 20L" no carrinho
    E o subtotal do carrinho é R$ 200,00
    Quando aplico o cupom "BEMVINDO10"
    Então o desconto deve ser de R$ 20,00
    E o frete deve permanecer grátis
    E o total deve ser de R$ 180,00

  @CT-011 @CA09 @regra-de-negocio
  Cenário: Não aplicar o desconto do cupom sobre o frete
    Dado que possuo 1 unidade da "Mochila Urbana 20L" no carrinho
    E o subtotal do carrinho é R$ 100,00
    Quando aplico o cupom "BEMVINDO10"
    Então o desconto sobre os produtos deve ser de R$ 10,00
    E o frete deve permanecer em R$ 19,90
    E o total deve ser de R$ 109,90