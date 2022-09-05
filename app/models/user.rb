class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_wastes, through: :bookmarks, source: :waste
  belongs_to :pickup, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { in: 4..20 }
  validates :address, presence: true

  before_create :check_pickup

  def check_pickup
    postal_code = address[/\d{5}/]
    self.pickup = Pickup.find_by(name: postal_code.to_s)
    # je stocke ds postal_code "75017", je veux le faire matcher avec
    # un pickup et l'associer
    # postal_code = pickup.name
  end
end
