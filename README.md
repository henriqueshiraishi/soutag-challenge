# Desafio Técnico - Ruby on Rails (Soutag)

## Descrição

Este projeto implementa o cálculo do preço final de um produto, considerando o preço base e a porcentagem de impostos. Além disso, foram adicionadas regras de desconto conforme solicitado:

1. Um desconto de 5% é aplicado se o produto for da categoria "food" ou "beverages";
2. Um desconto de 10% é aplicado se o mês atual concide com o mês de aniversário do usuário.

## Premissas Assumidas

- **Estrutura do Produto:** O produto contém os atributos `base_price`, `tax_percentage` e `category`. A categoria deve ser "food" ou "beverages" para que o desconto de 5% seja aplicado.
- **Estrutura do Usuário:** O usuário contém o atributo `birthday_month` para que seja comparado com mês atual (`Date.today.month`), e caso sejam iguais, o desconto de 10% é aplicado.
- **Cálculo do Desconto**: Os descontos por categoria e aniversário são calculados individualmentes sobre o preço final do produto (`base_price + tax_amount`).
- **Desconto Cumulativo**: Os descontos são cumulativos, ou seja, caso ambos sejam aplicados, eles serão somandos e aplicados ao preço final.
