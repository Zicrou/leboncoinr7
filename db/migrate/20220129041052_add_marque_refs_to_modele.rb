class AddMarqueRefsToModele < ActiveRecord::Migration[7.0]
  def change
    add_reference :modeles, :marque, null: false, foreign_key: true
  end
end
