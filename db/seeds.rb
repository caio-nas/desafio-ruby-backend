# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TipoTransacao.create(tipo: 1, descricao: 'Débito', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 2, descricao: 'Boleto', natureza: 'Saída', sinal: '-')
TipoTransacao.create(tipo: 3, descricao: 'Financiamento', natureza: 'Saída', sinal: '-')
TipoTransacao.create(tipo: 4, descricao: 'Crédito', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 5, descricao: 'Recebimento Empréstimo', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 6, descricao: 'Vendas', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 7, descricao: 'Recebimento TED', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 8, descricao: 'Recebimento DOC', natureza: 'Entrada', sinal: '+')
TipoTransacao.create(tipo: 9, descricao: 'Aluguel', natureza: 'Saída', sinal: '-')








