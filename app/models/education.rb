class Education < ApplicationRecord

  belongs_to :user

  validates :school, :presence => true
  validates :degree, :presence => true
  validates :field, :presence => true
  validates :description, :presence => true
  validates :start_year, :presence => true

end
