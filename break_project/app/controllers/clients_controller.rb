class ClientsController < ApplicationController
  def index
  end

  def show
    id = params[:id]
    @client = Client.find(id)
  end

  def create
    district = District.find(params[:district_id])
    district.clients.create(client_params)
    redirect_to district_path(params[:district_id])
  end

  def new
    @client = Client.new
    @action = "create"
    @method = :post
    @title = "Client Information"
  end

  def edit
    @title = "Edit Client Info"
    id = params[:id]
    @action = "update"
    @method = :patch
    @client = Client.find(id)
    render "new"
  end

  def update
    Client.update(params[:id], client_params)
    redirect_to district_path(params[:district_id])
  end

  def destroy
    id = params[:id]
    @client =Client.find(id).destroy
    redirect_to district_path(params[:district_id])
  end


  private
  def client_params
    params.require(:client).permit(:name, :dob, :address, :city, :state, :zip, :district)
  end
end
