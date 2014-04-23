class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Company Created"
      redirect_to 'show'
    else
      flash[:alert] = "Company not created"
      redirect_to 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
  end

  def delete
  end

private

  def company_params
    params.require(:company).permit(:name, :description)
  end
end
