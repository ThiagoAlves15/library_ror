# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum role: { client: 0, admin: 1 }

  has_many :reserves, dependent: :destroy
  has_many :books, through: :reserves
end
