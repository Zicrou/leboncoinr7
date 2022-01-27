class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :insider_image_car
      t.string :font_image_car
      t.string :profile_image_car
      t.string :marque
      t.string :modele
      t.bigint :prix
      t.integer :distance
      t.string :color
      t.date :year

      t.timestamps
    end
  end
end
