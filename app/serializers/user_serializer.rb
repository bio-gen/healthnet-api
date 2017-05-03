class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :professional_experience, :educational_background
end
