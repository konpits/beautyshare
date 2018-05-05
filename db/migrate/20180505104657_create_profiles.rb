class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country_code
      t.string :image_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
