class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }

  has_many :reserves
  has_many :books, through: :reserves
end
