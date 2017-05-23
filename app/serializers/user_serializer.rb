class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :title, :location, :institution, :date_of_birth, :phone_number

  has_many :work_experiences
  has_many :educations

end
