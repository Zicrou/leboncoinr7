class AddMarqueModeleToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :marque, foreign_key: true
    add_reference :cars, :modele, foreign_key: true
  end
end
