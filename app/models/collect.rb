class Collect < ApplicationRecord
  belongs_to :type

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
end
