class ParksController < ApplicationController
  def index
    @number = Park.find(1)
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.create(park_params)
    if @park.save
      if @park.id != 1
      @pronumber = Park.first
      @pronumber.delete
      redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  private
  def park_params
    params.require(:park).permit(:number)
  end
end
