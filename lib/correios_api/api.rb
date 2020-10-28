module CorreiosECT
  class Api

    def initialize
    end

    def consulta_cep(cep)
      request = Methods::ConsultaCep.new
      request.call(cep)
    end

    def busca_cliente
      request = Methods::BuscaCliente.new
      request.call()
    end

    def solicita_etiquetas(id_servico, qnt, tipo='c')
      request = Methods::SolicitaEtiquetas.new
      request.call(id_servico, qnt, tipo)
    end

    def digito_verificador_etiquetas(etiquetas)
      request = Methods::DigitoVerificadorEtiquetas.new
      request.call(etiquetas)
    end

    def fecha_plp(xml, id_plp_client, etiquetas)
      request = Methods::FechaPlp.new
      request.call(xml, id_plp_client, etiquetas)
    end

    def solicita_xml_plp(id_plp)
      request = Methods::SolicitaXmlPlp.new
      request.call(id_plp)
    end

    def calcula_preco_prazo(params)
      request = Methods::CalculaPrecoPrazo.new(params)
      request.call
    end

  end
end

