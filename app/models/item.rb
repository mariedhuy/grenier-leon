class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :category, presence: true

  has_one_attached :photo

  CATEGORIES = ["Cuisine", "Outils", "Loisirs"]
end
