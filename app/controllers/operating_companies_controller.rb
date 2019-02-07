class OperatingCompaniesController < ApplicationController
  def index
    @companies = OperatingCompany.all
  end

  def new
    @company = OperatingCompany.new
  end

  def show
    @company = OperatingCompany.find(params[:id])
  end

  def edit
    @company = OperatingCompany.find(params[:id])
  end

  def update
    @company = OperatingCompany.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def create
    @company = OperatingCompany.new(company_params)

    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def destroy
    @company = OperatingCompany.find(params[:id])
    @company.destroy

    redirect_to operating_companies_path
  end

  private

  def company_params
    params.require(:operating_company).permit(:operating_company_name, :home_page_url)
  end
end
