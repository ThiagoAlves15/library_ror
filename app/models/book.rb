# frozen_string_literal: true

class Book < ApplicationRecord
  acts_as_paranoid

  has_many :reserves, dependent: :destroy

  validates :title, :author, :category, presence: true

  scope :available, -> { left_outer_joins(:reserves).where('reserves.id IS NULL OR reserves.status IN (1, 2)') }

  def self.available
    book_ids = Book.all.map { |book|
      book unless book.reserves.any? { |reserve| reserve.reserved? || reserve.due? }
    }.compact.pluck(:id)

    return Book.where(id: book_ids)
  end
end
