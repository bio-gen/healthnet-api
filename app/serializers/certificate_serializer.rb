class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :title, :granted_by, :year

  belongs_to :user
end
