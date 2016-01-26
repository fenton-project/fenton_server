# Helps the organization controller with json api
class OrganizationSerializer < ActiveModel::Serializer
  attributes :name, :key
end
