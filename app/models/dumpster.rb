class Dumpster < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
end
