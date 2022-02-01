class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
    @modeles = Modele.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    @modeles = Modele.all
  end

  # GET /cars/1/edit
  def edit
    @modeles = Modele.all
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

  def filter
    @marque = params[:marqueId]
    #@domaine = params[:domaineId]
    if !@marque.nil?
      @modeles = Modele.where(marque_id: @marque)
      puts "marque= "+ @marque
      respond_to do |format|
        format.json { render json: @modeles }
      end
    end
    #render :index
    
  end

  def research
    @marque = research_params.fetch(:marque_id)
    @modele = research_params.fetch(:modele_id)
    @max_price = research_params.fetch(:max_price)
    @min_price = research_params.fetch(:min_price)
    
    
    # Research by nothing when everything is empty
    if @marque.empty? and @modele.empty? and @max_price and @min_price
      @cars = Car.all
    # Research by Marque
    elsif !@marque.empty? and @modele.empty? and @max_price and @min_price
      @cars = Car.search_by_marque(@marque)
    # Research by Modele
    elsif @marque.empty? and !@modele.empty? and @max_price and @min_price
      @cars = Car.search_by_modele(@modele)   
    # Research by Max Price
    elsif @marque.empty? and @modele.empty? and !@max_price and @min_price
      @cars = Car.search_by_max_price(@max_price)
    # Research by Min Price
    elsif @marque.empty? and @modele.empty? and @max_price and !@min_price
      @cars = Car.search_by_min_price(@min_price)
    # Research by Marque AND Modele
    elsif !@marque.empty? and !@modele.empty? and @max_price and @min_price
      @cars = Car.search_by_marque_modele(@marque, @modele)
    # Research by Marque AND MaxPrice
    elsif !@marque.empty? and @modele.empty? and !@max_price and @min_price
      @cars = Car.search_by_marque_max_price(@marque, @max_price)
    # Research by Marque AND MinPrice
    elsif !@marque.empty? and @modele.empty? and @max_price and !@min_price
      @cars = Car.search_by_marque_min_price(@marque, @min_price)
    # Research by Modele AND MaxPrice
    elsif @marque.empty? and !@modele.empty? and !@max_price and @min_price
    @cars = Car.search_by_modele_max_price(@modele, @max_price)
    # Research by Modele AND MinPrice
    elsif @marque.empty? and !@modele.empty? and @max_price and !@min_price
      @cars = Car.search_by_modele_min_price(@modele, @min_price)
    # Research by MaxPrice AND MinPrice
    elsif @marque.empty? and @modele.empty? and !@max_price and !@min_price
      @cars = Car.search_by_max_price_min_price(@max_price, @min_price)
    # Research by Marque AND Modele AND MaxPrice
    elsif !@marque.empty? and !@modele.empty? and !@max_price and @min_price
      @cars = Car.search_by_marque_modele_max_price(@marque, @modele, @max_price)
    # Research by Marque AND Modele AND MinPrice
    elsif !@marque.empty? and !@modele.empty? and @max_price and !@min_price
      @cars = Car.search_by_marque_modele_min_price(@marque, @modele, @min_price)
    # Research by Marque AND Modele AND MAxPrice AND MinPrice
    elsif !@marque.empty? and !@modele.empty? and !@max_price and !@min_price
      @cars = Car.search_by_marque_modele_max_and_min_price(@marque, @modele, @max_price, @min_price)
    end
    @modeles = Modele.all
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:marque_id, :modele_id, :price, :insider_image_car, :font_image_car, :profile_image_car, :distance, :description, :color, :year)
    end

    # Custom trusted parameter for research
    def research_params
      params.require(:car).permit(:marque_id, :modele_id, :max_price, :min_price)
    end
end
