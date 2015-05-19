class Job < ActiveRecord::Base
  belongs_to :city
  scope :sorted, -> { order(started_at: :desc) }
  scope :visible, -> { where(visible: true) }
  validates :title, presence: true, length: { maximum: 75 }
end
