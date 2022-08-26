class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favoris, dependent: :destroy
  has_many :produits, through: :favoris

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { in: 4..20 }
  validates :address, presence: true, uniqueness: true
end
