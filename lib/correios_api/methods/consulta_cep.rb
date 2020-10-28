module CorreiosECT
  module Methods
    class ConsultaCep
      attr_reader :client

      def initialize
        @client = CorreiosECT::Client.new
      end

      def call(cep='')
        response = client.call_request :consulta_cep, {cep: cep.gsub('-', '')}
        return response.consulta_cep_response.return
      end

    end
  end
end