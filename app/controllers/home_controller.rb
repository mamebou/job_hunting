class HomeController < ApplicationController
  def top
    @plans=Plan.all
  end

  def list
    @companies = Company.all
  end
end
