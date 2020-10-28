# Biblioteca de integração Correios em Ruby

## Descrição

A biblioteca Correios em Ruby é um conjunto de classes de domínio que facilitam, para o desenvolvedor Ruby, a utilização das funcionalidades que o Correios oferece na forma de APIs. Com a biblioteca instalada e configurada, você pode facilmente integrar funcionalidades que lhe permitem realizar todo o fluxo para gerar o e-ticket e fechar plp para envio do pedidido como:

 - Busca cliente [busca informações do contrato e os serviços disponíveis]
 - Calcular preco e prazo [retorna os valores e prazos para entrega de cada seviço]
 - Consultar cep [retorna o endereço pelo cep]
 - Solicitar etiquetas [retorna uma faixa de etiquetas valitadas]
 - Digito verificador de etiquetas [retorna os digitos verificadores de cada etiqueta na sequência que foram enviados]
 - Fechar plp [enviar as informações dos objetos que serãopostados nos Correios. O controle do encaminhamento dos objetos físicos será por meio de uma Pré-Llista de Postagem (Código PLP)]
 - Solicita xml plp [Este método retorna o mesmo xml da PLP que foi anteriormente enviada pelo cliente no fechamento da PLP, sendo atualizado no ato da postagem dos objetos nos Correios]

## Requisitos
 - [Ruby] 2.3.0+
 - Para o rails 5 no arquivo `correios_api.gemspec atualize` a versao do `'rack', '>= 1.6'` para `'rack', '~> 2.0.1'`

## Instalação
- Adicione a biblioteca ao seu Gemfile.

```ruby
gem "correios_api", github: "caverna-labs/correios_api"
```

 - Execute o comando `bundle install`.

Para fazer a autenticação, você precisará configurar as credenciais dos Correios(link do manual do ambiente de desenvolvimento: http://www.corporativo.correios.com.br/encomendas/sigepweb/doc/Manual_de_Implementacao_do_Web_Service_SIGEPWEB_Logistica_Reversa.pdf). Crie o arquivo `config/initializers/correios.rb` com o conteúdo abaixo.

```ruby
CorreiosECT.configure do |config|
  config.cnpj= "CNPJ"
  config.user= "Usuário"
  config.password = "Senha"
  config.administrative_code = "Código Administrativo"
  config.contract = "Contrato"
  config.code_service = "Código Serviço"
  config.card = "Cartão"
  config.environment = [:development/:production] (ambiente)
end
```

## Buscar cliente

Este método retorna os serviços disponíveis no contrato para um determinado
cartão de postagem. Este método pode ser utilizado periodicamente para atualizar sua tabela de servicos disponiveis.

```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# chamada do metodo
api.busca_cliente()

```

## Consultar CEP
```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# chamada do metodo
api.consulta_cep('64023400')
```

## Calcular preco e prazo

O calculador de preços e prazos de encomendas dos Correios é destinado aos clientes que possuem contrato de SEDEX, e-SEDEX e PAC, que necessitam calcular, no seu ambiente e de forma personalizada, o preço e o prazo de entrega de uma encomenda.
É possível também a um cliente que não possui contrato de encomenda com os Correios realizar o cálculo, porém neste caso os preços apresentados serão aqueles praticados no balcão da agência. Mais informações da documentação no link: http://www.correios.com.br/para-voce/correios-de-a-a-z/pdf/calculador-remoto-de-precos-e-prazos/manual-de-implementacao-do-calculo-remoto-de-precos-e-prazos

```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# cria objeto a ser consultado (os parâmetos mínimos solicitatods pela api)
# todos os parâmetos disponíveis
service: 'Código do serviço, pode ser obitido no metodo busca_cliente()'
cep_sender: 'CEP de Origem sem hífen.Ex: 05311900 '
cep_receiver: 'CEP de Destino sem hífen'
weight: 'Peso da encomenda, incluindo sua embalagem. O peso deve ser informado em quilogramas. Ex: "0,5" ou "2"'
type_object: 'Formato da encomenda (incluindo embalagem). Valores possíveis: 1, 2 ou 3 1 – Formato caixa/pacote 2 – Formato rolo/prisma 3 - Envelope'
width: 'Comprimento da encomenda (incluindo embalagem), em centímetros.'
height: 'Altura da encomenda (incluindo embalagem), em centímetros. Se o formato for envelope, informar zero (0).'
length: 'Largura da encomenda (incluindo embalagem), em centímetros.'
diameter: 'Diâmetro da encomenda (incluindo embalagem), em centímetros.'
value: 'Indica se a encomenda será entregue com o serviço adicional valor declarado. Neste campo deve ser apresentado o valor declarado desejado, em Reais. Ex: "43,32"'
own_hand: 'Indica se a encomenda será entregue com o serviço adicional mão própria. Valores possíveis: S ou N (S – Sim, N – Não)'
receiving_notice: 'Indica se a encomenda será entregue com o serviço adicional aviso de recebimento. Valores possíveis: S ou N (S – Sim, N – Não)'

# criando objeto
preco_prazo = CorreiosECT::Resource::CalculaPrecoPrazo.new({service: '81019,41068,40096', cep_sender:  '69309560', cep_receiver:  '64023400', weight:  '0,4'})

# chamada do metodo
api.calcula_preco_prazo(preco_prazo)
```

## Solicitar etiquetas

Este método retorna numeração de registro(s) dos Correios para futura postagem
de objeto(s). O número de registro é o identificador do objeto no fluxo postal da ECT,
sendo utilizado como chave para rastreamento.
```
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# chamada do metodo
servico = 104672 #código do servico obitido no metodo busca_cliente()
qnt = 1 #quantidade de etiquetas
etiquetas = api.solicita_etiquetas(servico, qnt)
```

## Digito verificador de etiquetas

Este método retorna o dígito verificador de uma etiqueta ou um array.

```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# chamada do metodo
digitos = api.digito_verificador_etiquetas(etiquetas)
```

## Fechar plp

Este método é responsável por enviar as informações dos objetos que serão postados nos Correios. O controle do encaminhamento dos objetos físicos será por meio de uma Pré-Llista de Postagem (Código PLP). Permite o envio de vários objetos de diferentes serviços, pois o campo listaEtiquetas é um array dos objetos constantes no XML. A seqüência dos objetos contidos no array listaEtiquetas deverá ser a mesma do XML, que também é enviado por parâmetro no momento de acionar o método. Os objetos informados no array listaEtiquetas não devem conter o dígito verificador. Já no XML é obrigatório informar o dígito verificador da etiqueta.

```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# criar objeto do remetente
sender = CorreiosECT::Resource::Sender.new({name: "joao", street: " ef e few fewewf", number: "343", complement: "", district: "", zip_code: "69309560", city: "teresina", state: "RJ", phone: "86994211487"})

# criar objeto do destinatário
receiver = CorreiosECT::Resource::Receiver.new({name: "pedro", street: " ef e few fewewf", number: "343", complement: "", district: "", zip_code: "64023400", city: "teresina", state: "PI", phone: "86994211487", text: 'asdsadsa dassa dsasasda'})

# cria um ou mas objetos postage que seram enviados
postages = []
etiquetas.each_with_index do |etiqueta, i|
  postages << CorreiosECT::Resource::Postage.new({ticket: etiqueta.gsub(' ', digitos[i]), service: cod_serv, weight: '800', height: 16, width: 10, length: 10, receiver: receiver})
end

# cria objeto plp que ira gerar o xml para fechar a plp
plp = CorreiosECT::Resource::Plp.new({sender: sender, postages: postages})

# chamada do metodo
tickts = etiquetas.map{|x| x.gsub(' ', '')}
fecha_plp = api.fecha_plp(plp.get_xml, 542234, tickts)
```

## Solicita xml plp

Este método retorna o mesmo xml da PLP que foi anteriormente enviada pelo cliente no fechamento da PLP, sendo atualizado no ato da postagem dos objetos nos Correios

```ruby
require 'correios_api'

# inicializa a api
api = CorreiosECT::Api.new

# chamada do metodo
solicita_plp = api.solicita_xml_plp(fecha_plp)
```
---

## Referências
  * documentação SIGEP : http://www.corporativo.correios.com.br/encomendas/sigepweb/doc/Manual_de_Implementacao_do_Web_Service_SIGEPWEB_Logistica_Reversa.pdf
  * documentação para calculo de frete: http://www.correios.com.br/para-voce/correios-de-a-a-z/pdf/calculador-remoto-de-precos-e-prazos/manual-de-implementacao-do-calculo-remoto-de-precos-e-prazos

  [documentação SIGEP]: http://www.corporativo.correios.com.br/encomendas/sigepweb/doc/Manual_de_Implementacao_do_Web_Service_SIGEPWEB_Logistica_Reversa.pdf
  [documentação para calculo de frete]: http://www.correios.com.br/para-voce/correios-de-a-a-z/pdf/calculador-remoto-de-precos-e-prazos/manual-de-implementacao-do-calculo-remoto-de-precos-e-prazos

---

## Contributing

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Don't forget to rebase with branch master in main project before submit the pull request.
- Please don't change the gemspec file, Rakefile, version, or history.

## Autor
- [Leandro Falcão](https://github.com/lsfalcao)

## Copyright

- [Leandro Falcão](https://github.com/lsfalcao)
- [QW3 Software & Marketing](https://qw3.com.br)

![QW3 Logo](http://qw3.com.br/qw3_logo.png)

The MIT License (MIT)

Copyright (c) 2020 Leandro Falcão

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

