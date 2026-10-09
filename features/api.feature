# language: pt

@api
Funcionalidade: API da Verzel Store
  Como responsável pela qualidade
  Quero validar os endpoints da loja
  Para garantir que cálculos e validações sejam aplicados corretamente

  @CT-015 @positivo
  Cenário: Listar os produtos disponíveis
    Quando envio uma requisição GET para "/api/produtos"
    Então a API deve responder com status 200
    E a resposta deve conter uma lista de produtos
    E cada produto deve possuir id, nome, descrição, categoria e preço

  @CT-016 @CA01 @positivo
  Cenário: Calcular um carrinho com cupom válido
    Quando envio uma requisição POST para "/api/carrinho/calcular" com:
      """
      {
        "itens": [
          { "produtoId": "P002", "quantidade": 1 },
          { "produtoId": "P004", "quantidade": 2 }
        ],
        "cupom": "BEMVINDO10"
      }
      """
    Então a API deve responder com status 200
    E o subtotal deve ser 239.70
    E o desconto deve ser 23.97
    E o frete deve ser 0
    E o total deve ser 215.73
    E o cupom deve estar marcado como aplicado

  @CT-017 @CA03 @negativo
  Cenário: Calcular um carrinho com cupom inexistente
    Quando envio uma requisição POST para "/api/carrinho/calcular" com:
      """
      {
        "itens": [
          { "produtoId": "P005", "quantidade": 1 }
        ],
        "cupom": "CUPOMINVALIDO"
      }
      """
    Então a API deve responder com status 200
    E nenhum desconto deve ser aplicado
    E o cupom deve estar marcado como não aplicado
    E a mensagem do cupom deve informar "Cupom inválido."

  @CT-018 @CA10 @limite @negativo
  Cenário: Rejeitar quantidade superior a cinco unidades
    Quando envio uma requisição POST para "/api/carrinho/calcular" com:
      """
      {
        "itens": [
          { "produtoId": "P006", "quantidade": 6 }
        ]
      }
      """
    Então a API deve responder com status 422
    E o código do erro deve ser "QUANTIDADE_MAXIMA_EXCEDIDA"
    E o campo do erro deve identificar "itens[0].quantidade"

  @CT-019 @positivo
  Cenário: Confirmar um pedido válido
    Quando envio uma requisição POST para "/api/pedidos" com:
      """
      {
        "cliente": {
          "nome": "Maria Silva",
          "email": "maria@exemplo.com",
          "cep": "01310-100"
        },
        "itens": [
          { "produtoId": "P005", "quantidade": 1 }
        ],
        "cupom": "BEMVINDO10"
      }
      """
    Então a API deve responder com status 201
    E o número do pedido deve seguir o formato "VZ-000000"
    E o subtotal deve ser 100.00
    E o desconto deve ser 10.00
    E o frete deve ser 19.90
    E o total deve ser 109.90

  @CT-020 @negativo
  Cenário: Rejeitar pedido com cupom inexistente
    Quando envio uma requisição POST para "/api/pedidos" com:
      """
      {
        "cliente": {
          "nome": "Maria Silva",
          "email": "maria@exemplo.com",
          "cep": "01310-100"
        },
        "itens": [
          { "produtoId": "P005", "quantidade": 1 }
        ],
        "cupom": "CUPOMINVALIDO"
      }
      """
    Então a API deve responder com status 422
    E o código do erro deve ser "CUPOM_INVALIDO"