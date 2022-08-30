class Waste < ApplicationRecord
  has_many :element_wastes, dependent: :destroy
  has_many :elements, through: :element_wastes

  validates :name, presence: true
end
