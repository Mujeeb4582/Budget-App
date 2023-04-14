class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
