class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.text :osusume
      t.text :sakerubeki
      t.string :image

      t.timestamps
    end
  end
end
