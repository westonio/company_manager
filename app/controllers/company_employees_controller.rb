class CompanyEmployeesController < ApplicationController
  def index
    @company = Company.find(params[:id])
    if params[:sort] == "A-Z"
      @employees = Employee.where(company_id: @company.id).order(first_name: :asc)
    else
      @employees = Employee.where(company_id: @company.id)
    end
  end
end