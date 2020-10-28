module CorreiosECT
	class Client

		attr_accessor :env
		attr_reader :client, :uri

		def initialize(env = CorreiosECT.environment)
	    @env = env.to_sym
			@uri = get_base_uri

			@client = Savon.client(opts)
		end

		def development?
			env == :development
		end

		def production?
			env == :production
		end

		def opts
			options = {adapter: :net_http_persistent, wsdl: @uri, :ssl_verify_mode=> :none, open_timeout: 30, read_timeout: 30 }

			options.merge!({ headers: { 'SOAPAction' => '' }})

			options
		end

		def call_request(method, message)
			resp = @client.call method, message: message

			Response.new resp.http.code, resp.body
		end

		def get_base_uri
			if production?
				'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
			else
				"https://apphom.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl"
			end
		end
	end
end