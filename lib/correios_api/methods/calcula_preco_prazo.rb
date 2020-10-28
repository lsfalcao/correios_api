module CorreiosECT
  module Methods
    class CalculaPrecoPrazo
      attr_reader :object

      def initialize(params)
        @object = params
      end

      def call
        return get_calculations()
      end

      def get_calculations
        http = Net::HTTP::Persistent.new 'correios'
        response = http.request url()
        res = JSON.parse(Hash.from_xml(response.body).to_json)
        res = res["cResultado"]["Servicos"]["cServico"]
        a = res.map{|x| CorreiosECT::Response.new x}
        http.shutdown

        return a
      end

      def url
        uri = URI "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx/CalcPrecoPrazo?nCdEmpresa=#{CorreiosECT.administrative_code}&sDsSenha=#{CorreiosECT.password}&nCdServico=#{object.service}&sCepOrigem=#{object.cep_sender}&sCepDestino=#{object.cep_receiver}&nVlPeso=#{object.weight}&nCdFormato=#{object.type_object}&nVlComprimento=#{object.width}&nVlAltura=#{object.height}&nVlLargura=#{object.length}&nVlDiametro=#{object.diameter}&sCdMaoPropria=#{object.own_hand}&nVlValorDeclarado=#{object.value}&sCdAvisoRecebimento=#{object.receiving_notice}"
        return uri
      end

    end
  end
end