class TransacaoController < ActionController
    def saldo_por_loja
        @saldo_por_loja = Transacao.saldo_por_loja
        render plain: 'Teste'
    end
end