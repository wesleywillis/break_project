class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
    @worker = Worker.find(params[:worker_id])
    @client = Client.find(@worker.client_id)
    @header = "Clock in?"
    @action = "create"
    @method = :post
    @label = :start
  end

  def edit
    @header = "Clock out?"
    id = params[:id]
    @shift = Shift.find(id)
    @action = "update"
    @method = :patch
    @label = :stop
    render "new"
  end

  def create
    worker = Worker.find(params[:worker_id])
    client = Client.find(worker.client_id)

    worker.shifts.create(
      start: Time.now.strftime('%H:%M:%S').to_i,
      worker_id: params[:worker_id],
      )
    redirect_to district_client_worker_path(client.district_id, client.id, worker.id)
  end

  def update
    worker = Worker.find(params[:worker_id])
    client = Client.find(worker.client_id)
    shift = worker.shifts.find(params[:id])
    shift.update(
    stop: Time.now.strftime('%H:%M:%S').to_i,
    )
    redirect_to district_client_worker_path(client.district_id, client.id, worker.id)
  end

  private
  def shift_params
    params.require(:shift).permit(:start, :stop, :worker_id)
  end
end
