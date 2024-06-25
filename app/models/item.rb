class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :category, presence: true

  has_one_attached :photo

  CATEGORIES = ["Cuisine", "Outils", "Loisirs", "Électroménager"]

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_category,
  against: [ :category ],
  using: {
    tsearch: { prefix: true }
  }
end
