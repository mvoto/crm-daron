# Crm Daron [![Code Climate](https://codeclimate.com/github/mvoto/crm-daron/badges/gpa.svg)](https://codeclimate.com/github/mvoto/crm-daron)

This is a specific crm project.

### Rspec
* There is a sample .rspec file in .rspec.example, you should copy it to
.rspec if you don't have one yet.
* To use capybara power on acceptance tests, check out this [cheat sheet](https://gist.github.com/zhengjia/428105)

## Tips
* On acceptance/features tests, you can use `save_and_open_page` to open the current
tested page on your browser. This gem does the trick: [launchy](https://github.com/copiousfreetime/launchy)
* After creating models and execute the migrations, run:
`annotate --exclude tests,fixtures,factories -p after`
* Always keep seeds file updated when adding new ActiveRecord models
* Use rails c --sandbox to use console and not save any register(rollback on exit)

#### TODO

VERSION 1:
- Nothing to do here, yay !

VERSION 2:
- Add an export button on customers to generate a .xls file
- Add customer's details print version with button / link
- Separate login / user roles(to be discussed)

#### Reuniao 15/02

1- Melhorar o layout [FEITO]
2- Melhorar os detalhes do cliente: apresentar todas as infos possiveis [FEITO]
3- Adicionar a busca por data de compra de aparelho(ou melhor, criar uma tela com
  o filtro aplicado, com ordenação inicial feita pela data de compra mais antiga) [FEITO]
4- Possibilidade de anexar a audiometria(tanto imagens como pdf) - upload [FEITO]
5- **Criar uma ficha cadastral de cada cliente para impressão**
6- Adicionar uma sessão de prontuário(com data e informação) para
  efeito de histórico - adicionar uma listagem na tela de detalhes do cliente, similar à listagem de aparelhos[WIP]
7- Melhoria no cadastro / busca de clientes(atualmente temos problemas com dados duplicados e dados que se perdem)[FEITO]

* Há uma necessidade de ter uma ficha cadastral de cada cliente
* Existe a necessidade de adicionar um prontuário(com data e informação) para
  efeito de histórico - na tela de detalhes do cliente, customer has many handbooks
  agora é tocar o esquema de controller + view assim como Devices
* Adicionar em Gráficos, infos de Dashboard: total de clientes, total de aparelhos, etc
e os gráficos(pizza) de usuários por tipos talvez

# AWS KEYS

AKIAIFXOVGXYDBXKXCOA
UP17kD681dCQUPehnm1HAv/1TjOmWu5AR8NjrRC1
