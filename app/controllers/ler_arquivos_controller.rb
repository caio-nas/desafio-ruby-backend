class LerArquivosController < ApplicationController
  
  # GET /ler_arquivos or /ler_arquivos.json
  def index
   # @ler_arquivos = LerArquivo.all
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
