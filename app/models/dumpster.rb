class Dumpster < ApplicationRecord
  belongs_to :category
  validates :address, presence: true
end
