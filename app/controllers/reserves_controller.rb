# frozen_string_literal: true

class ReservesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :reserve_book
  before_action :set_reserve, only: %i[show edit update destroy]

  # GET /reserves or /reserves.json
  def index
    # @reserves = if params[:search]
    #               # Reserve.where(
    #               #   "CONCAT(name->>'title', ' ', name->>'first', ' ', name->>'last') ILIKE ?", "%#{params[:search]}%"
    #               # ).order(:email).page(params[:page])
    #             end
    if can? :manage, Reserve
      @reserves = Reserve.order(devolution_date: :desc).page(params[:page])
    else
      @reserves = current_user.reserves.order(devolution_date: :desc).page(params[:page])
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

    respond_to do |format|
      if @reserve.save
        format.html { redirect_to reserve_url(@reserve), notice: 'Reserve was successfully created.' }
        format.json { render :show, status: :created, location: @reserve }
      else
        format.html { render :new, status: :unprocessable_entity }
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
    params.require(:reserve).permit(:book_id, :user_id, :reserve_date, :devolution_date)
  end
end
