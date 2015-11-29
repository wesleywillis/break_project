class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def show
    id = params[:id]
    @district = District.find(id)
  end

  def create
    District.create(district_params)
    redirect_to districts_path
  end

  def new
    @district = District.new
    @action = "create"
    @method = :post
    @title = "District Information"
  end

  def edit
    @title = "Edit your district"
    id = params[:id]
    @action = "update"
    @method = :patch
    @district = District.find(id)
    render "new"
  end

  def update
    District.update(params[:id], district_params[:district])
    redirect_to district_path(params[:id])
  end

  private
  def district_params
    params.require(:district).permit(:name, :address, :city, :state, :zip)
  end
end
