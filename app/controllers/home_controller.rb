# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @user_books_categories = current_user.user_books_categories if current_user.present?
    @last_reserve = current_user.reserves.last if current_user.present?
  end
end
