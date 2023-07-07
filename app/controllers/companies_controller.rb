class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def employees_index
    @company = Company.find(params[:id])
    @employees = Employee.where(company_id: @company.id)
  end
end