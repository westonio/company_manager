class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :federal_ein
      t.boolean :non_profit
      t.string :address_line_1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
