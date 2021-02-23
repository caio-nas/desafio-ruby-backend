class LerArquivo < ApplicationRecord
    def self.ler_arquivo(arquivo)
        # trata arquivo
        arquivo = arquivo['arquivo']

        text = File.open(arquivo.original_filename).read
        text.gsub!(/\r\n?/, "\n")
        text.each_line do |line|
          cria_transacao(line)
        end
    end

    def self.cria_transacao(transacao)
        # chama metodo que cria registro no banco
        Transacao.cria_transacao(transacao)
    end
end
