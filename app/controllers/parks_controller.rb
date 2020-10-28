class ParksController < ApplicationController
  def index
    @park = Park.first
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
      render :index
      else
      render :index
      end
    else
      redirect
    end
  end

  def show
    @park = Park.first
    end_point
    tictok
  end

  private
  def park_params
    params.require(:park).permit(:number)
  end

  def tictok
    start_point
    @@fee = @@end_point - @point 
    if @@fee <= 1800
        @finalfee = 0
    elsif @@fee < 21600
        @finalfee = 100
    else
      final_cul
      @finalfee = @@final_fee
    end

  end

  def start_point
    @point = @park.created_at.tv_sec
  end

  def end_point
    t = Time.now
    @@end_point = t.tv_sec
  end

  def final_cul
    ex_time = @@fee - 21600
    ex = ex_time / 21600
    exb = ex.floor
    @@final_fee = 150 + exb * 50
  end

  def redirect
    redirect_to  root_path,notice:'redirectに成功しました'
  end

end
