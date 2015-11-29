class ClientsController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end


  private
  def client_params
    params.require(:client).permit(:name, :dob, :address, :city, :state, :zip, :district)
  end
end
