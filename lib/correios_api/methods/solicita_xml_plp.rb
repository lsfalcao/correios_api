module CorreiosECT
  module Methods
    class SolicitaXmlPlp
      attr_reader :client

      def initialize
        @client = CorreiosECT::Client.new
      end

      def call(id_plp)
        plp = { idPlpMaster: id_plp, usuario: CorreiosECT.user, senha: CorreiosECT.password }

        response = @client.call_request :solicita_xml_plp, plp

        return CorreiosECT::Response.new(Hash.from_xml(response.solicita_xml_plp_response.return)).correioslog
      end

    end
  end
end