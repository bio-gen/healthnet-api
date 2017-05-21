class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :location, :start_year, :end_year, :current, :description

  belongs_to :user
end
