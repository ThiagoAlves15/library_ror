class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[ show edit update destroy ]

  # GET /reserves or /reserves.json
  def index
    @reserves = Reserve.all
  end

  # GET /reserves/1 or /reserves/1.json
  def show
  end

  # GET /reserves/new
  def new
    @reserf = Reserve.new
  end

  # GET /reserves/1/edit
  def edit
  end

  # POST /reserves or /reserves.json
  def create
    @reserf = Reserve.new(reserf_params)

    respond_to do |format|
      if @reserf.save
        format.html { redirect_to reserf_url(@reserf), notice: "Reserve was successfully created." }
        format.json { render :show, status: :created, location: @reserf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserves/1 or /reserves/1.json
  def update
    respond_to do |format|
      if @reserf.update(reserf_params)
        format.html { redirect_to reserf_url(@reserf), notice: "Reserve was successfully updated." }
        format.json { render :show, status: :ok, location: @reserf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1 or /reserves/1.json
  def destroy
    @reserf.destroy

    respond_to do |format|
      format.html { redirect_to reserves_url, notice: "Reserve was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserf
      @reserf = Reserve.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserf_params
      params.require(:reserf).permit(:book_id, :user_id, :reserve_date, :devolution_date, :status)
    end
end
