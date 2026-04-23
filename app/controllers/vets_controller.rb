class VetsController < ApplicationController
  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.includes(appointments: :pet).find(params[:id])
  end
end
