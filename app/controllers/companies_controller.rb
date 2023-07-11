class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(created_at: :desc)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
    company = Company.new(
      name: params[:name],
      federal_ein: params[:federal_ein].to_i,
      non_profit: params[:non_profit],
      address_line_1: params[:address_line_1],
      address_line_2: params[:address_line_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode]
    )
    company.save
    redirect_to "/companies"
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(
      name: params[:name],
      federal_ein: params[:federal_ein],
      non_profit: params[:non_profit],
      address_line_1: params[:address_line_1],
      address_line_2: params[:address_line_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode]
    )
    company.save
    redirect_to "/companies/#{company.id}"
  end

  def destroy
    company = Company.find(params[:id])
    employees = company.employees
    employees.destroy_all
    company.destroy
    redirect_to "/companies"
  end
end