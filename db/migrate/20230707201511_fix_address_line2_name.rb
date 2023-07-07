class FixAddressLine2Name < ActiveRecord::Migration[7.0]
  def change
    rename_column("companies", "address_line2", "address_line_2")
  end
end
