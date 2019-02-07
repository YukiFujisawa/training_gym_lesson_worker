class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def create
    @operating_company = OperatingCompany.find(params[:operating_company_id])
    @operating_company.shops.create(shop_params)
    redirect_to @operating_company
  end

  def destroy
    @operating_company = OperatingCompany.find(params[:operating_company_id])
    @shop = @operating_company.shops.find(params[:id])
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to operating_company_path(@operating_company)
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name)
  end
end
