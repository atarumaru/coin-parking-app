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
      start_point
      if @park.id != 1
      @pronumber = Park.first
      @pronumber.delete
      redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def show
    end_point
    tictok
  end

  private
  def park_params
    params.require(:park).permit(:number)
  end

  def tictok
    @@fee = @@end_point - @@point + 1800
    puts @@fee
    if @@fee <= 1800
        puts @@fee
        puts '無料です'
    elsif @@fee < 21600
        puts '100'
    else
      final_cul
      puts @@final_fee
    end

  end

  def start_point
    t = Time.now
    @@point = t.tv_sec
  end

  def end_point
    t = Time.now
    @@end_point = t.tv_sec
  end

  def final_cul
    ex_time = @@fee - 21600
    ex = ex_time / 21600
    puts ex
    exb = ex.floor
    puts exb
    @@final_fee = 100 + exb * 50
  end

end
