class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(created_at: :desc)
  end

  def show
    @company = Company.find(params[:id])
  end

  def employees_index
    @company = Company.find(params[:id])
    @employees = Employee.where(company_id: @company.id)
  end

  def new
  end

  def create
    company = Company.new(
      name: params[:company][:name],
      federal_ein: params[:company][:federal_ein].to_i,
      non_profit: params[:company][:non_profit],
      address_line_1: params[:company][:address_line_1],
      address_line_2: params[:company][:address_line_2],
      city: params[:company][:city],
      state: params[:company][:state],
      zipcode: params[:company][:zipcode]
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
      name: params[:company][:name],
      federal_ein: params[:company][:federal_ein],
      non_profit: params[:company][:non_profit],
      address_line_1: params[:company][:address_line_1],
      address_line_2: params[:company][:address_line_2],
      city: params[:company][:city],
      state: params[:company][:state],
      zipcode: params[:company][:zipcode]
    )
    company.save
    redirect_to "/companies/#{company.id}"
  end
end