# language: pt

@checkout
Funcionalidade: Finalização da compra
  Como cliente da Verzel Store
  Quero informar meus dados
  Para confirmar meu pedido

  @CT-021 @positivo
  Cenário: Confirmar pedido com dados válidos
    Dado que possuo 1 unidade da "Mochila Urbana 20L" no carrinho
    E prossigo para a finalização da compra
    Quando informo o nome "Maria Silva"
    E informo o e-mail "maria@exemplo.com"
    E informo o CEP "01310-100"
    E confirmo o pedido
    Então o pedido deve ser confirmado
    E deve ser apresentado um número no formato "VZ-000000"
    E não deve ser solicitada uma etapa de pagamento online

  @CT-022 @positivo
  Cenário: Aceitar CEP válido sem hífen
    Dado que possuo um produto no carrinho
    E prossigo para a finalização da compra
    Quando informo o nome "Maria Silva"
    E informo o e-mail "maria@exemplo.com"
    E informo o CEP "01310100"
    E confirmo o pedido
    Então o pedido deve ser confirmado

  @CT-023 @negativo
  Cenário: Impedir pedido com nome sem sobrenome
    Dado que possuo um produto no carrinho
    E prossigo para a finalização da compra
    Quando informo o nome "Maria"
    E informo o e-mail "maria@exemplo.com"
    E informo o CEP "01310-100"
    E tento confirmar o pedido
    Então o pedido não deve ser confirmado
    E o campo de nome deve ser indicado como inválido

  @CT-024 @negativo
  Cenário: Impedir pedido com e-mail inválido
    Dado que possuo um produto no carrinho
    E prossigo para a finalização da compra
    Quando informo o nome "Maria Silva"
    E informo o e-mail "maria@"
    E informo o CEP "01310-100"
    E tento confirmar o pedido
    Então o pedido não deve ser confirmado
    E o campo de e-mail deve ser indicado como inválido

  @CT-025 @negativo
  Cenário: Impedir pedido com CEP de quantidade inválida de dígitos
    Dado que possuo um produto no carrinho
    E prossigo para a finalização da compra
    Quando informo o nome "Maria Silva"
    E informo o e-mail "maria@exemplo.com"
    E informo o CEP "01310-10"
    E tento confirmar o pedido
    Então o pedido não deve ser confirmado
    E o campo de CEP deve ser indicado como inválido