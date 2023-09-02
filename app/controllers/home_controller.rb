class HomeController < ApplicationController
  def top
    @plan=Plan.all
  end

  def list
    @companies = Company.all
  end
end
