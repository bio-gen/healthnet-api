class WorkExperience < ApplicationRecord
  belongs_to :user

  validates :title, :presence => true
  validates :company, :presence => true
  validates :location, :presence => true
  validates :start_year, :presence => true
  validates :description, :presence => true
end
