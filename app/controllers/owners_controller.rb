class OwnersController < ApplicationController
  def index
    @owners = Owner.includes(:pets)
  end

  def show
    @owner = Owner.includes(:pets).find(params[:id])
  end
end
