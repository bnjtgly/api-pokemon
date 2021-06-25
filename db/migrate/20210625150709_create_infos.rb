class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.belongs_to :pokemon, foreign_key: true
      t.integer :pokedex_id
      t.string :nick_name
      t.string :favorite_color
      t.string :favorite_food
      t.string :moveset
      t.timestamps
    end
  end
end
