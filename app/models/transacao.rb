class Transacao < ActiveRecord::Base
    def self.sanitizacao_transacao(transacao)
        transacao_sanitizada = {}
        transacao_sanitizada['tipo_transacao_id'] = transacao[0].to_i
        transacao_sanitizada['data_ocorrencia'] = transacao[1..8].to_date
        transacao_sanitizada['valor_movimentacao'] = '%.2f' % (transacao[9..18].to_f/100.00)
        transacao_sanitizada['cpf'] = transacao[19..29]
        transacao_sanitizada['cartao'] = transacao[30..41]
        transacao_sanitizada['hora_ocorrencia'] = transacao[42..47].insert(2,':').insert(5,':')
        transacao_sanitizada['nome_representante'] = transacao[48..61]
        transacao_sanitizada['nome_loja'] = transacao[62..80]
        transacao_sanitizada
    end

    def self.cria_transacao(transacao)
        transacao_sanitizada = sanitizacao_transacao(transacao)
        hora_ocorrencia = transacao_sanitizada['data_ocorrencia'].to_s + ' ' + transacao_sanitizada['hora_ocorrencia']
        Transacao.transaction do
            Transacao.create(
                tipo_transacao_id: transacao_sanitizada['tipo_transacao_id'],
                data_ocorrencia: transacao_sanitizada['data_ocorrencia'],
                valor_movimentacao: transacao_sanitizada['valor_movimentacao'],
                cpf: transacao_sanitizada['cpf'],
                cartao: transacao_sanitizada['cartao'],
                hora_ocorrencia: hora_ocorrencia,
                nome_representante: transacao_sanitizada['nome_representante'],
                nome_loja: transacao_sanitizada['nome_loja'].strip
                )
        end
    end

    def self.saldo_por_loja
        transacoes = Transacao.all.order('hora_ocorrencia asc')
        lojas = transacoes.pluck(:nome_loja)
        lojas_saldo = {}

        lojas.each do |loja|
          lojas_saldo[loja] = 0
        end

        transacoes.each_with_index do |tr, index|
            lojas_saldo[lojas[index]] += tr.valor_movimentacao if tr.nome_loja == lojas[index] and [1,4,5,6,7,8].include?(tr.tipo_transacao_id.to_i)
            lojas_saldo[lojas[index]] -= tr.valor_movimentacao if tr.nome_loja == lojas[index] and [2,3,9].include?(tr.tipo_transacao_id.to_i)
        end
        
        lojas_saldo
    end
end

