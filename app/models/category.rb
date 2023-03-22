class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true
  ICONS = ['fa fa-car', 'fa fa-camera', 'fa fa-plane', 'fa fa-book', 'fa fa-music', 'fa fa-film'].freeze
end
