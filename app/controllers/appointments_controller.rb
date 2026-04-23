class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.includes(:pet, :vet)
  end

  def show
    @appointment = Appointment.includes(:pet, :vet, :treatments).find(params[:id])
  end
end
