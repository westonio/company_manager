class Company < ApplicationRecord
  has_many :employees

  def employee_count
    self.employees.count
  end
end