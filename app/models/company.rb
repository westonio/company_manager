class Company < ApplicationRecord
  has_many :employees

  def employee_count
    self.employees.count
  end

  def alphabetical_employees
    self.employees.order(first_name: :asc)
  end

  def salary_more_than(amount)
    self.employees.where("salary > #{amount.to_i}")
  end
end