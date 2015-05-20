# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
  has_many :jobs
  scope :featured, -> { where(featured: true) }
  scope :unfeatured, -> { where(featured: false) }
  scope :sorted, -> { order(:position) }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
