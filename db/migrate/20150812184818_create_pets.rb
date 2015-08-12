class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :size
      t.string :color
      t.string :breed
      t.string :found_location
      t.string :lost_date
      t.string :gender
      t.string :animal_type
    end
  end
end
