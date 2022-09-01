class Waste < ApplicationRecord
  has_many :element_wastes, dependent: :destroy
  has_many :elements, through: :element_wastes
  has_many :categories, through: :elements

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
    tsearch: { prefix: true }
  }
end
