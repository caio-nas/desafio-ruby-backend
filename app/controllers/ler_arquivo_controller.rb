class LerArquivoController < ActionController::Base

    def index
      render plain: 'Bem vindo'
    end


    def ler_arquivo
      render json: { status: 200, dados: LerArquivo.ler_arquivo(ler_arquivo_params) },
                status: :ok, content_type: 'application/json'
    end

    private

    def ler_arquivo_params
      params.permit(:arquivo)
    end
end
