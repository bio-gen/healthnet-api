class EducationSerializer < ActiveModel::Serializer
  attributes :id, :school, :degree, :field, :description, :start_year, :end_year, :current

  belongs_to :user
end
