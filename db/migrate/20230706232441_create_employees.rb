class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :i9_eligible
      t.boolean :benefits_eligible
      t.integer :salary

      t.timestamps
    end
  end
end
