class Car < ApplicationRecord
    belongs_to :marque
    belongs_to :modele

    attr_accessor :max_price, :min_price
    
    validates_presence_of :marque_id, :modele_id, :prix, :insider_image_car, :font_image_car, :profile_image_car, :distance, :description, :color, :year
    has_rich_text :description
    has_many :messages, dependent: :destroy

    has_one_attached :insider_image_car
    has_one_attached :font_image_car
    has_one_attached :profile_image_car

    # Research by Marque
    def self.search_by_marque(marque)
        where(marque_id: marque)
    end
    
    # Research by Modele
    def self.search_by_modele(modele)
        where(modele_id: modele)
    end

    # Research by Max Price
    def self.search_by_max_price(max_price)
        where("price <= ?", max_price)
    end

    # Research by Min Price
    def self.search_by_min_price(min_price)
        where("price >= ?", min_price)
    end

    # Research by Marque & Modele
    def self.search_by_marque_modele(marque, modele)
        where(marque_id: marque, modele_id: modele)
    end

    # Research by Marque & Max Price
    def self.search_by_marque_max_price(marque, max_price)
        where(marque_id: marque).where("price <= ?", max_price)
    end

    # Research by Marque & Min Price
    def self.search_by_marque_min_price(marque, min_price)
        where(marque_id: marque).where("price >= ?", min_price)
    end

    # Research by Modele & Max Price
    def self.search_by_modele_max_price(modele, max_price)
        where(modele_id: modele).where("price <= ?", max_price)
    end

    # Research by Modele & Min Price
    def self.search_by_modele_min_price(modele, min_price)
        where(modele_id: modele).where("price >= ?", min_price)
    end

    # Research by Max Price & Min Price
    def self.search_by_max_price_min_price(max_price, min_price)
        where("price <= ?", max_price).where("price >= ?", min_price)
    end

    # Research by Marque, Modele AND Max Price
    def self.search_by_marque_modele_max_price(marque, modele, max_price)
        where(marque_id: marque).where(modele_id: modele).where("price <= ?", max_price)
    end

    # Research by Marque, Modele AND Min Price
    def self.search_by_marque_modele_min_price(marque, modele, min_price)
        where(marque_id: marque).where(modele_id: modele).where("price >= ?", min_price)
    end

    # Research by Marque AND Modele AND MAxPrice AND MinPrice
    def self.search_by_marque_modele_max_and_min_price(marque, modele, max_price, min_price)
        where(marque_id: marque).where(modele_id: modele).where("price <= ?", max_price).where("price >= ?", min_price)
    end
end
