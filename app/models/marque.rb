class Marque < ApplicationRecord
    has_many :modeles
    has_many :cars

    validates_presence_of :name
end
