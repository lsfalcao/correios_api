module CorreiosECT
  module Resource
    class Receiver
      include ActiveData::Model

      attribute :name, type: String, default: ''
      attribute :street, type: String, default: ''
      attribute :number, type: String, default: ''
      attribute :complement, type: String, default: ''
      attribute :district, type: String, default: ''
      attribute :zip_code, type: String, default: ''
      attribute :city, type: String, default: ''
      attribute :state, type: String, default: ''
      attribute :phone, type: String, default: ''
      attribute :email, type: String, default: ''
      attribute :text, type: String, default: ''
    end
  end
end
