class AliensController < ApplicationController
  def index
    @aliens = Alien.sorted
  end

  def show
    @alien = Alien.find(params[:id])
  end

  def new
    @alien = Alien.new
  end
  
  def create
    @alien = Alien.new(alien_params)
    if @alien.save
      redirect_to(:action => "index")
    else
      render "new"
    end
  end

  def edit
    @alien = Alien.find(params[:id])
  end
  
  def update
    @alien = Alien.find(params[:id])
    if @alien.update_attributes(alien_params)
      redirect_to(:action => "show", :id => @alien.id)
    else
      render "edit"
    end
  end

  def delete
    @alien = Alien.find(params[:id]).destroy
    redirect_to(:action => "index")
  end

  private
  def alien_params
    params.require(:alien).permit(:name, :year, :month, :origin)
  end
end
