class PowersController < ApplicationController
  def new
    @power =Alien.find(params[:alien_id]).powers.new
  end
  
  def create
    @power = Alien.find(params[:alien_id]).powers.new(power_params)
    if @power.save
      redirect_to(:controller => 'aliens', :action => "show", :id => @power.alien.id)
    else
      render "new"
    end
  end

  def edit
    @power = Alien.find(params[:alien_id]).powers.find(params[:id])
  end
  
  def update
    @power = Alien.find(params[:alien_id]).powers.find(params[:id])
    if @power.update_attributes(power_params)
      redirect_to(:controller => 'aliens', :action => "show", :id => @power.alien.id)
    else
      render "edit"
    end
  end

  def delete
    @power = Power.find(params[:id]).destroy
    redirect_to(:controller => 'aliens', :action => "show", :id => @power.alien.id)
  end
  
  private
  def power_params
    params.require(:power).permit(:ability)
  end

end
