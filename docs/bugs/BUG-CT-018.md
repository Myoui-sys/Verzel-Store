# BUG-CT-018 — API aceita quantidade superior ao limite de cinco unidades

## Status

Aberto

## Severidade

Alta

## Prioridade

Alta

## Critério e cenário relacionados

- Critério de aceite: CA10
- Cenário de teste: CT-018

## Ambiente

- Aplicação: Verzel Store
- Versão: 2.3.0
- Sistema operacional: Windows
- Cliente utilizado: PowerShell
- Data: 10/10/2026

## Endpoint

`POST /api/carrinho/calcular`

## Pré-condições

- API disponível.
- Requisição enviada com o cabeçalho `Content-Type: application/json`.

## Corpo da requisição

```json
{
  "itens": [
    {
      "produtoId": "P006",
      "quantidade": 6
    }
  ]
}
```

## Passos para reprodução

1. Enviar uma requisição `POST` para `/api/carrinho/calcular`.
2. Informar o produto `P006` com quantidade `6`.
3. Enviar o corpo da requisição como JSON.
4. Observar o status HTTP e o corpo da resposta.

## Resultado esperado

A API deve rejeitar a quantidade superior a cinco unidades e responder com status `422`.

O corpo da resposta deve apresentar:

- código `QUANTIDADE_MAXIMA_EXCEDIDA`;
- campo `itens[0].quantidade`;
- mensagem informando que a quantidade máxima permitida foi excedida.

## Resultado obtido

A API respondeu com status `200`, aceitou a quantidade `6` e calculou normalmente o carrinho.

Foram retornados os seguintes valores:

- quantidade: `6`;
- subtotal: `179.4`;
- desconto: `0`;
- frete: `19.9`;
- total: `199.3`;
- valor faltante para frete grátis: `20.6`.

Nenhum objeto de erro foi retornado.

## Frequência

Reproduzido durante a execução do CT-018.

## Impacto

A regra de quantidade máxima pode ser contornada por clientes que consumam a API diretamente.

O comportamento também é inconsistente com a interface, que bloqueia corretamente a inclusão da sexta unidade. Isso permite que a API calcule um carrinho em um estado considerado inválido pela regra de negócio.

## Evidência

[Ver evidência](../../evidencias/api/CT-018/01-api-aceita-quantidade-acima-limite.png)