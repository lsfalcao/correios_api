module CorreiosECT
  module Methods
    class BuscaCliente
      attr_reader :client

      def initialize
        @client = CorreiosECT::Client.new
      end

      def call
        busca_cliente = {idContrato: CorreiosECT.contract, idCartaoPostagem: CorreiosECT.card, usuario: CorreiosECT.user, senha: CorreiosECT.password }
        response = client.call_request :busca_cliente, busca_cliente

        servicos = []
        response.busca_cliente_response.return.contratos.cartoes_postagem.servicos.each do |servico|
          item = {nome: servico.descricao, id: servico.id.to_i, codigo: servico.codigo.to_i}
          servicos << CorreiosECT::Response.new(item)
        end

        return servicos
      end

    end
  end
end