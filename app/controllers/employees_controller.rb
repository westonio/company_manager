class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.where(i9_eligible: true)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @company = Company.find(params[:id])
  end

  def create
    company = Company.find(params[:id])
    company.employees.create(
      first_name: params[:employee][:first_name],
      last_name: params[:employee][:last_name],
      i9_eligible: params[:employee][:i9_eligible],
      benefits_eligible: params[:employee][:benefits_eligible],
      salary: params[:employee][:salary]
    )

    redirect_to "/companies/#{company.id}/employees"
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update(
      first_name: params[:employee][:first_name],
      last_name: params[:employee][:last_name],
      i9_eligible: params[:employee][:i9_eligible],
      benefits_eligible: params[:employee][:benefits_eligible],
      salary: params[:employee][:salary]
    )
    employee.save
    redirect_to "/employees/#{employee.id}"
  end
end