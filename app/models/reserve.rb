# frozen_string_literal: true

class Reserve < ApplicationRecord
  acts_as_paranoid

  belongs_to :book
  belongs_to :user

  enum status: { reserved: 0, returned: 1, due: 2 }

  validates :reserve_date, :devolution_date, :status, presence: true
  validate :book_is_available

  def book_is_available
    self.errors.add(:book_id, message: 'Not available') if book.try(:check_availability)
  end
end
