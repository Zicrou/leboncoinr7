class Modele < ApplicationRecord
    belongs_to :marque
    has_many :cars

    validates_presence_of :name, :marque_id
    
    
end
