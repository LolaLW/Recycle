class Element < ApplicationRecord
  belongs_to :category
  belongs_to :waste
end
