class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
    @worker = Worker.find(params[:worker_id])
    @client = Client.find(@worker.client_id)
  end

  def create
    worker = Worker.find(params[:worker_id])
    client = Client.find(worker.client_id)

    district.client.worker.shifts.create(
      start: Time.now,
      stop: Time.now,
      worker_id: params[:worker_id],
      )
    redirect_to district_client_worker_path(client.district_id, client.id, worker.id)
  end

  private
  def shift_params
    params.require(:shift).permit(:start, :stop, :worker_id)
  end
end
