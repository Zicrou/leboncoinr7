class Message < ApplicationRecord
  belongs_to :car

  broadcasts_to :car

end
