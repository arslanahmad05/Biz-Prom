class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_name, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :phone, null: false
      t.string :company_name, null: false
      t.text :company_bio, null: false
      t.string :gender, null: false
      t.timestamps
    end
  end
end
