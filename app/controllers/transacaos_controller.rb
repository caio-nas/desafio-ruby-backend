#encoding: utf-8
class TransacaosController < ApplicationController

   def saldo_por_loja
     @saldo_por_loja = Transacao.saldo_por_loja
   end

end