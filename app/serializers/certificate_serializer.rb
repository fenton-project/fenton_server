# Helps the certificate controller with json api
class CertificateSerializer < ActiveModel::Serializer
  attributes :certificate, :client_id, :project_id
end
