class CompaniesController < ApplicationController
  def index
    @companies = ["DripDrop Coffee", "Who Knows", "Another Shop"]
  end
end