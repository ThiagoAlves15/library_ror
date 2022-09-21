# frozen_string_literal: true

json.extract! reserve, :id, :book_id, :user_id, :reserve_date, :devolution_date, :status, :created_at, :updated_at
json.url reserve_url(reserve, format: :json)
