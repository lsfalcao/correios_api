module CorreiosECT
  module Methods
    class SolicitaEtiquetas
      attr_reader :client

      def initialize
        @client = CorreiosECT::Client.new
      end

      def call(id_servico, qnt, tipo = 'c')
        etiquetas = {tipoDestinatario: tipo, identificador: CorreiosECT.cnpj, idServico: id_servico, qtdEtiquetas: qnt, usuario: CorreiosECT.user, senha: CorreiosECT.password}
        response = client.call_request :solicita_etiquetas, etiquetas
        tickets = []
        tickets_range = response.solicita_etiquetas_response.return.split(",")
        a1 = tickets_range[0].gsub(/[A-z\s]/, '').to_i
        a2 = tickets_range[1].gsub(/[A-z\s]/, '').to_i
        count = a2 - a1 + 1
        count.times do |i|
          b = "#{a1+i}"
          unless b.size == 8
            (8-b.size).times do
              b = "0#{b}"
            end
          end
          tickets << tickets_range[0].gsub(/\d/, '').gsub(' ', "#{b} ")
        end

        return tickets
      end

    end
  end
end
