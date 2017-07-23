class PowersController < ApplicationController
  def new
    @power = Alien.find(params[:alien_id]).powers.new
  end
  
  def create
    @power = Alien.find(params[:alien_id]).powers.build(power_params)
    if @power.save
      redirect_to alien_path(@power.alien)
    else
      render "new"
    end
  end

  def edit
    @power = Power.find(params[:id])
  end
  
  def update
    @power = Power.find(params[:id])
    if @power.update_attributes(power_params)
      redirect_to alien_path(@power.alien)  
    else
      render "edit"
    end
  end

  def destroy
    @power = Power.find(params[:id]).destroy
    redirect_to alien_path(@power.alien)  
  end
  
  private
  def power_params
    params.require(:power).permit(:ability)
  end
end
