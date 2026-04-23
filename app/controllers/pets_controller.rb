class PetsController < ApplicationController
  def index
    @pets = Pet.includes(:owner)
  end

  def show
    @pet = Pet.includes(:owner, :appointments).find(params[:id])
  end
end
