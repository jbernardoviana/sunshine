  class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :solar_panel
  has_many :transactions

  validates :start_date, presence: true
  validates :user_id, presence: true
  validates :solar_panel_id, presence: true
  validates_uniqueness_of :solar_panel_id, :scope => :user_id

  def producer
    solar_panel.user
  end

end
