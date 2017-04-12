class DojosController < ApplicationController
  def index
    @count = Dojo.count
    @dojos = Dojo.all
  end

  def new
  end

  def create
    @dojo = Dojo.new(dojo_params)
    if @dojo.save
      redirect_to :root
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
    end
  end

  private
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
