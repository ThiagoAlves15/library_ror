# frozen_string_literal: true

class Book < ApplicationRecord
  acts_as_paranoid

  has_many :reserves, dependent: :destroy

  validates :title, :author, :category, presence: true
end
