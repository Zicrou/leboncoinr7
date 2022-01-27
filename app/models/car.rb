class Car < ApplicationRecord
    validates_presence_of :marque, :modele, :prix, :insider_image_car, :font_image_car, :profile_image_car, :distance, :description, :color, :year
    has_rich_text :description
    has_many :messages, dependent: :destroy

    has_one_attached :insider_image_car
    has_one_attached :font_image_car
    has_one_attached :profile_image_car
end
