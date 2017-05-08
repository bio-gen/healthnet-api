class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name

  has_many :work_experiences

end
