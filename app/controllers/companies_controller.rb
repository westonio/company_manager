class CompaniesController < ApplicationController
  def index
    @companies = ["DripDrop Coffee", "Who Knows", "Another Shop"]
  end

  def show
    @company = Company.find(params[:id])
  end
end