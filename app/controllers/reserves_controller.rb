# frozen_string_literal: true

class ReservesController < ApplicationController
  load_and_authorize_resource
  before_action :set_reserve, only: %i[show edit update destroy]
  before_action :set_select_fields_options, only: %i[ new create edit update ]

  # GET /reserves or /reserves.json
  def index
    if can? :manage, Reserve
      if params[:search]
        @reserves = Reserve.joins(:book).where('books.title ILIKE ?', "%#{params[:search]}%").order(devolution_date: :desc).page(params[:page])
      else
        @reserves = Reserve.order(devolution_date: :desc).page(params[:page])
      end
    else
      if params[:search]
        @reserves = current_user.reserves.joins(:book).where('books.title ILIKE ?', "%#{params[:search]}%").order(devolution_date: :desc).page(params[:page])
      else
        @reserves = current_user.reserves.order(devolution_date: :desc).page(params[:page])
      end
    end
  end

  # GET /reserves/1 or /reserves/1.json
  def show; end

  # GET /reserves/new
  def new
    @reserve = Reserve.new
  end

  # GET /reserves/1/edit
  def edit; end

  # POST /reserves or /reserves.json
  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.reserve_date = DateTime.now

    @reserve.book_id = reserve_params[:book_id] unless reserve_params[:book_id].present?
    @reserve.user_id = current_user.id if reserve_params[:user_id].blank? && !current_user.admin?
    @reserve.devolution_date = DateTime.now + 3.days unless reserve_params[:devolution_date].present?

    respond_to do |format|
      if @reserve.save
        if can? :manage, Reserve
          format.html { redirect_to reserve_url(@reserve), notice: 'Reserve was successfully created.' }
        else
          format.html { redirect_to books_url, status: :created, notice: 'Reserve was successfully created.'  }
        end
        format.json { render :show, status: :created, location: @reserve }
      else
        if can? :manage, Reserve
          format.html { render :new, status: :unprocessable_entity }
        else
          format.html { redirect_to books_url, status: :unprocessable_entity, alert: @reserve.errors.full_messages }
        end
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserves/1 or /reserves/1.json
  def update
    respond_to do |format|
      if @reserve.update(reserve_params)
        format.html { redirect_to reserve_url(@reserve), notice: 'Reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserve }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1 or /reserves/1.json
  def destroy
    @reserve.destroy

    respond_to do |format|
      format.html { redirect_to reserves_url, notice: 'Reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reserve
    @reserve = Reserve.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reserve_params
    params.require(:reserve).permit(:book_id, :user_id, :reserve_date, :devolution_date, :status)
  end

  def set_select_fields_options
    @users_array = User.clients.map { |user| [user.name, user.id] }
    @books_array = Book.available.map { |book| [book.title, book.id] }
    @books_array << [@reserve.book.title, @reserve.book_id] if @reserve.book.present?
  end
end
