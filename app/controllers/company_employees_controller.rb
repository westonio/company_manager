class CompanyEmployeesController < ApplicationController
  def index
    @company = Company.find(params[:id])
    # require 'pry'; binding.pry
    if params[:sort] == "A-Z"
      @employees = @company.alphabetical_employees
    elsif !params[:number].nil?
      @employees = @company.salary_more_than(params[:number])
    else
      @employees = @company.employees
    end
  end
end