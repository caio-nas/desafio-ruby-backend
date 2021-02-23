class CreateTransacao < ActiveRecord::Migration[5.2]
  def change
    create_table :transacaos do |t|
      t.references :tipo_transacao, foreign_key: true, limit: 1
      t.date :data_ocorrencia
      t.float :valor_movimentacao, limit: 10
      t.string :cpf, limit: 11
      t.string :cartao, limit: 12
      t.timestamp :hora_ocorrencia
      t.string :nome_representante, limit: 20
      t.string :nome_loja, limit: 20

      t.timestamps
    end
  end
end
