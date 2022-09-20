class Book < ApplicationRecord
  has_many :reserves

  validates :title, :author, :category, presence: true
end
