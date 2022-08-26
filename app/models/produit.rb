class Produit < ApplicationRecord
  belongs_to :type
  belongs_to :user

  validates :name, presence: true
end
