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

    # Researcch by Marque
    def self.search_by_marque(id)
        where(marque_id: id)
    end
    
    # Researcch by Modele
    def self.search_by_modele(id)
        where(modele_id: id)
    end

    # Researcch by Max Price
    def self.search_by_max_price(max_price)
        where(price > max_price)
    end

    # Researcch by Min Price
    def self.search_by_max_price(min_price)
        where(price > min_price)
    end

    # Researcch by Marque & Modele
    def self.search_by_marque_modele(id_marque, id_modele)
        where(marque_id: id_marque, modele_id: id_modele)
    end
end
