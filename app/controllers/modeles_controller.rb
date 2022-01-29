class ModelesController < ApplicationController
  before_action :set_modele, only: %i[ show edit update destroy ]

  # GET /modeles or /modeles.json
  def index
    @modeles = Modele.all
  end

  # GET /modeles/1 or /modeles/1.json
  def show
  end

  # GET /modeles/new
  def new
    @modele = Modele.new
  end

  # GET /modeles/1/edit
  def edit
  end

  # POST /modeles or /modeles.json
  def create
    @modele = Modele.new(modele_params)

    respond_to do |format|
      if @modele.save
        format.html { redirect_to modele_url(@modele), notice: "Modele was successfully created." }
        format.json { render :show, status: :created, location: @modele }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @modele.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modeles/1 or /modeles/1.json
  def update
    respond_to do |format|
      if @modele.update(modele_params)
        format.html { redirect_to modele_url(@modele), notice: "Modele was successfully updated." }
        format.json { render :show, status: :ok, location: @modele }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @modele.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modeles/1 or /modeles/1.json
  def destroy
    @modele.destroy

    respond_to do |format|
      format.html { redirect_to modeles_url, notice: "Modele was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modele
      @modele = Modele.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def modele_params
      params.require(:modele).permit(:name, :marque_id)
    end
end
