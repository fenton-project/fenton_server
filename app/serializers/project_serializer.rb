# Helps the project controller with json api
class ProjectSerializer < ActiveModel::Serializer
  attributes :name, :description, :ca_public_key
end
