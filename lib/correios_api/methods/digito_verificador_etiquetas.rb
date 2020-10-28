module CorreiosECT
  module Methods
    class DigitoVerificadorEtiquetas
      attr_reader :client

      def initialize
        @client = CorreiosECT::Client.new
      end

      def call(etiquetas)
        digito = {usuario: CorreiosECT.user, senha: CorreiosECT.password, etiquetas: etiquetas}
        response = client.call_request :gera_digito_verificador_etiquetas, digito
        if etiquetas.size == 1
          d = []
          digitos = d << response.gera_digito_verificador_etiquetas_response.return
        else
          digitos = response.gera_digito_verificador_etiquetas_response.return
        end
        return digitos
      end

    end
  end
end