module CorreiosECT
  module Resource
    class CalculaPrecoPrazo
      include ActiveData::Model

      attribute :service, type: String
      attribute :cep_sender, type: String
      attribute :cep_receiver, type: String
      attribute :weight, type: String
      attribute :type_object, type: Integer, default: 1
      attribute :height, type: Integer, default: 20
      attribute :width, type: Integer, default: 30
      attribute :length, type: Integer, default: 38
      attribute :diameter, type: Integer, default: 0
      attribute :value, type: String, default: '0'
      attribute :own_hand, type: String, default: 'n'
      attribute :receiving_notice, type: String, default: 'n'

    end
  end
end