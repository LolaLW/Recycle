class Favori < ApplicationRecord
  belongs_to :user
  belongs_to :produit
end
