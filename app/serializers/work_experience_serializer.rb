class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :location, :start_date, :end_date, :current, :description
end