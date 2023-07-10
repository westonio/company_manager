class CompanyEmployeesController < ApplicationController
  def index
    @company = Company.find(params[:id])
    @employees = Employee.where(company_id: @company.id)
  end
end