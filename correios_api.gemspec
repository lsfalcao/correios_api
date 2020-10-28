# -*- encoding: utf-8 -*-
# stub: correios_api 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "correios_api".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Renato Filho".freeze, "Pedro Fausto".freeze]
  s.date = "2020-08-13"
  s.description = "Cliente ruby para api correios".freeze
  s.email = ["renatosousafilho@gmail.com".freeze, "pedro.fausto@hotmail.com".freeze]
  s.files = [".gitignore".freeze, ".ruby-gemset".freeze, ".ruby-version".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "README.md".freeze, "Rakefile".freeze, "correios_api.gemspec".freeze, "examples/teste_client.rb".freeze, "lib/correios_api.rb".freeze, "lib/correios_api/api.rb".freeze, "lib/correios_api/client.rb".freeze, "lib/correios_api/config.rb".freeze, "lib/correios_api/methods/busca_cliente.rb".freeze, "lib/correios_api/methods/calcula_preco_prazo.rb".freeze, "lib/correios_api/methods/consulta_cep.rb".freeze, "lib/correios_api/methods/digito_verificador_etiquetas.rb".freeze, "lib/correios_api/methods/fecha_plp.rb".freeze, "lib/correios_api/methods/solicita_etiquetas.rb".freeze, "lib/correios_api/methods/solicita_xml_plp.rb".freeze, "lib/correios_api/resource/calcula_preco_prazo.rb".freeze, "lib/correios_api/resource/plp.rb".freeze, "lib/correios_api/resource/postage.rb".freeze, "lib/correios_api/resource/receiver.rb".freeze, "lib/correios_api/resource/sender.rb".freeze, "lib/correios_api/response.rb".freeze, "lib/correios_api/version.rb".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Cliente ruby para api correios".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<recursive-open-struct>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<active_data>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<net-http-persistent>.freeze, ["~> 2.9.4"])
      s.add_runtime_dependency(%q<rack>.freeze, ["~> 2.0.1"])
      s.add_runtime_dependency(%q<savon>.freeze, ["~> 2.11.1"])
      s.add_runtime_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<webmock>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<recursive-open-struct>.freeze, [">= 0"])
      s.add_dependency(%q<active_data>.freeze, [">= 0"])
      s.add_dependency(%q<net-http-persistent>.freeze, ["~> 2.9.4"])
      s.add_dependency(%q<rack>.freeze, ["~> 2.0.1"])
      s.add_dependency(%q<savon>.freeze, ["~> 2.11.1"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<recursive-open-struct>.freeze, [">= 0"])
    s.add_dependency(%q<active_data>.freeze, [">= 0"])
    s.add_dependency(%q<net-http-persistent>.freeze, ["~> 2.9.4"])
    s.add_dependency(%q<rack>.freeze, ["~> 2.0.1"])
    s.add_dependency(%q<savon>.freeze, ["~> 2.11.1"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
