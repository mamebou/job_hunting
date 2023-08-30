class HomeController < ApplicationController
  def top
    @companies = Company.all
  end
end
