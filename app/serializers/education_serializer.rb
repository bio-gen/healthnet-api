class EducationSerializer < ActiveModel::Serializer
  attributes :id, :school, :degree, :field, :description, :from_year, :to_year

  belongs_to :user
end
