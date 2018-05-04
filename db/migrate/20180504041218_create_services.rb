class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.integer :price_per_hour
      t.integer :min_duration
      t.integer :max_duration
      t.string :image_data
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
