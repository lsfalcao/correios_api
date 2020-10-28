#!/bin/ruby
require 'active_data'
require 'recursive-open-struct'
require "forwardable"
require 'net/http/persistent'
require 'nokogiri'
require 'savon'

require 'correios_api/api'
require 'correios_api/client'
require 'correios_api/config'
require 'correios_api/response'
require 'correios_api/version'

require 'correios_api/methods/busca_cliente'
require 'correios_api/methods/calcula_preco_prazo'
require 'correios_api/methods/consulta_cep'
require 'correios_api/methods/digito_verificador_etiquetas'
require 'correios_api/methods/fecha_plp'
require 'correios_api/methods/solicita_etiquetas'
require 'correios_api/methods/solicita_xml_plp'

require 'correios_api/resource/calcula_preco_prazo'
require 'correios_api/resource/postage'
require 'correios_api/resource/receiver'
require 'correios_api/resource/sender'
require 'correios_api/resource/plp'

module CorreiosECT
	class << self

    extend Forwardable

    def_delegators :configuration, :cnpj, :user, :password, :administrative_code, :contract, :code_service, :card, :environment

		def configuration
			@configuration ||= Config.new
		end

		def configure(&block)
			yield configuration
		end
	end
end

