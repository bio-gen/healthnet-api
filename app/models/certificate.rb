class Certificate < ApplicationRecord
  belongs_to :user

  validates :title, :presence => true
  validates :granted_by, :presence => true
  validates :year, :presence => true
end
