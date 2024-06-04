# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: t("company.created")
    else
      render :new
    end
  end

  def update
    @company = Company.find(params[:id])
    if @Company.update(company_params)
      redirect_to companies_path, notice: t("company.updated")
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path, notice: t("company.deleted")
  end

  private

  def company_params
    params.require(:company).permit(:name, :logo)
  end
end
