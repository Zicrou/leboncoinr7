class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def research
    @marque = research_params.fetch(:marque_id)
    @modele = research_params.fetch(:modele_id)
    @max_price = research_params.fetch(:max_price)
    @min_price = research_params.fetch(:min_price)
    #puts "Max Price: " +@max_price
    #puts "Min Price: " +@min_price
    #puts "Color " +@color
    if @marque.empty? and @modele.empty? and @max_price and @min_price
      @cars = Car.all
    elsif !@marque.empty? and @modele.empty? and @max_price and @min_price
      @cars = Car.search_by_marque(@marque)
    elsif @marque.empty? and !@modele.empty? and @max_price and @min_price
      @cars = Car.search_by_modele(@modele)   
    elsif @marque.empty? and @modele.empty? and !@max_price and @min_price
      #@cars = Car.search_by_marque_modele(@marque, @modele)
    elsif @marque.empty? and @modele.empty? and @max_price and !@min_price
      #@cars = Car.search_by_marque_modele(@marque, @modele)
    elsif !@marque.empty? and !@modele.empty? and @max_price and @min_price
      @cars = Car.search_by_marque_modele(@marque, @modele)
    elsif !@marque.empty? and !@modele.empty? and !@max_price and @min_price
      #@cars = Car.search_by_marque_modele(@marque, @modele)
    elsif !@marque.empty? and !@modele.empty? and @max_price and !@min_price
      #@cars = Car.search_by_marque_modele(@marque, @modele)
    elsif !@marque.empty? and !@modele.empty? and !@max_price and !@min_price
      #@cars = Car.search_by_marque_modele(@marque, @modele)
    end
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:marque_id, :modele_id, :prix, :insider_image_car, :font_image_car, :profile_image_car, :distance, :description, :color, :year)
    end

    # Custom trusted parameter for research
    def research_params
      params.require(:car).permit(:marque_id, :modele_id, :max_price, :min_price)
    end
end
