# Helps the client controller with json api
class ClientSerializer < ActiveModel::Serializer
  attributes :name, :public_key
end
