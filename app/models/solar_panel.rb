class SolarPanel < ActiveRecord::Base
  # Prosumer
  belongs_to :user
  has_many :contracts, dependent: :destroy

  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than: 0 }
  validates :size, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :user_id

  before_validation :get_address, on: :create
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def get_address
    self.address = user.address
  end
end
