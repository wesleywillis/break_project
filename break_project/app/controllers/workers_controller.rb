class WorkersController < ApplicationController
  def show
    id = params[:id]
    @worker = Worker.find(id)
    @client = Client.find(params[:client_id])
  end

  def new
    @header = "Add A New Worker"
    @worker = Worker.new
    @action = "create"
    @method = :post
  end

  def edit
    @header = "Edit Worker Info"
    id = params[:id]
    @worker = Worker.find(id)
    @action = "update"
    @method = :patch
    render "new"
  end

  def create
    id = params[:client_id]
    client = Client.find(id)
    client.workers.create(worker_params)
    redirect_to district_client_path(client.district_id, id)
  end

  def update
    id = params[:client_id]
    client = Client.find(id)
    worker = client.workers.find(params[:id])
    worker.update(worker_params)
    redirect_to client_path(id)
  end

  def destroy
    id = params[:id]
    client = Client.find(params[:client_id])
    Worker.find(id).destroy
    redirect_to district_client_path(client.district_id, client.id)
  end

  private
  def worker_params
   params.require(:worker).permit(:name, :dob, :address, :city, :state, :zip, :client_id)
  end

end
