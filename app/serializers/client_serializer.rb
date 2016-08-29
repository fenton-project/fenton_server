# Helps the client controller with json api
class ClientSerializer < ActiveModel::Serializer
  attributes :username, :name, :email, :public_key
end
