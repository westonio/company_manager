class Employee < ApplicationRecord
  belongs_to :company

  def name
    "#{self.first_name} #{self.last_name}"
  end
end