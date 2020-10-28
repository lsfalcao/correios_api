require 'correios_api'
require_relative './config/configuration'
require 'pry'

api = CorreiosECT::Api.new

cod_serv = 81019
servico = 104672
postages = []

# preco_prazo = CorreiosECT::Resource::CalculaPrecoPrazo.new({service: '81019,41068,40096', cep_sender:  '69309560', cep_receiver:  '64023400', weight:  '0,4'})

# api.calcula_preco_prazo(preco_prazo)

sender = CorreiosECT::Resource::Sender.new({name: "joao", street: "Rua das Mil Flores", number: "343", complement: "", district: "Pricumã", zip_code: "69309560", city: "Boa Vista", state: "RR", phone: "86994211487"})

receiver = CorreiosECT::Resource::Receiver.new({name: "pedro", street: "epitacio pessoa", number: "343", complement: "", district: "lourival parente", zip_code: "64023400", city: "teresina", state: "PI", phone: "86994211487", text: 'asdsadsa dassa dsasasda'})

etiquetas = api.solicita_etiquetas(servico, 1)
digitos = api.digito_verificador_etiquetas(etiquetas)

etiquetas.each_with_index do |etiqueta, i|
  postages << CorreiosECT::Resource::Postage.new({ticket: etiqueta.gsub(' ', digitos[i]), service: cod_serv, weight: '800', type_object: 1, height: 16, width: 10, length: 10, receiver: receiver})
end
plp = CorreiosECT::Resource::Plp.new({sender: sender, postages: postages})

tickts = etiquetas.map{|x| x.gsub(' ', '')}

fecha_plp = api.fecha_plp(plp.get_xml, 542234, tickts)
puts fecha_plp

id_plp = '65841490'
binding.pry


# solicita_plp = api.solicita_xml_plp(id_plp)

