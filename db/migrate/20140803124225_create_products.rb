class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.text :description
      t.string :telephone
      t.integer :category_id
      t.integer :user_id
      t.integer :university_id
      t.string :street
      t.string :state
      t.string :country
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
