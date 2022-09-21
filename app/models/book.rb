# frozen_string_literal: true

class Book < ApplicationRecord
  acts_as_paranoid

  has_many :reserves, dependent: :destroy

  validates :title, :author, :category, presence: true

  scope :available, -> { left_outer_joins(:reserves).where('reserves.id IS NULL OR reserves.status IN (1, 2)') }
end
