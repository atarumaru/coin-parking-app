class ParksController < ApplicationController
  def index
    @number = Park.find(1)
  end

  def new
    @number = Park.new
  end
end
