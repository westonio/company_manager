class AddCompaniesToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :company, null: false, foreign_key: true
  end
end
