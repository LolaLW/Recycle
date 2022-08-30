class Element < ApplicationRecord
  belongs_to :category, optional: true
  has_many :element_wastes, dependent: :destroy
  has_many :wastes, through: :element_wastes
end
