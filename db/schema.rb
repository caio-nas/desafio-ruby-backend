# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_18_010508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tipo_transacaos", force: :cascade do |t|
    t.integer "tipo", limit: 2
    t.string "descricao", limit: 20
    t.string "natureza", limit: 10
    t.string "sinal", limit: 1
  end

  create_table "transacaos", force: :cascade do |t|
    t.bigint "tipo_transacao_id"
    t.date "data_ocorrencia"
    t.float "valor_movimentacao"
    t.string "cpf", limit: 11
    t.string "cartao", limit: 12
    t.date "hora_ocorrencia"
    t.string "nome_representante", limit: 20
    t.string "nome_loja", limit: 20
    t.index ["tipo_transacao_id"], name: "index_transacaos_on_tipo_transacao_id"
  end

  add_foreign_key "transacaos", "tipo_transacaos"
end
