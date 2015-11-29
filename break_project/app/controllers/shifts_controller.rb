class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
    @worker = Worker.find(params[:worker_id])
    @client = Client.find(@worker.client_id)
  end

#need to think about how this method will worke
#maybe new will mean clock in
#and edit will mean clock out
  def create
    worker = Worker.find(params[:worker_id])
    client = Client.find(worker.client_id)

    worker.shifts.create(
      start: Time.now.strftime('%H:%M:%S').to_i,
      stop: Time.now.strftime('%H:%M:%S').to_i,
      worker_id: params[:worker_id],
      )
    redirect_to district_client_worker_path(client.district_id, client.id, worker.id)
  end

  private
  def shift_params
    params.require(:shift).permit(:start, :stop, :worker_id)
  end
end
