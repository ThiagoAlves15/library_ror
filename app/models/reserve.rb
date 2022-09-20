class Reserve < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: { reserved: 0, returned: 1, due: 2 }

  validates :reserve_date, :devolution_date, :status, presence: true
end
