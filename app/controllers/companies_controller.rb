class CompaniesController < ApplicationController
  
  before_filter :check_admin, only: [:create, :update, :new, :edit]
  
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.xml { render xml: @company}
      format.json { render json: @company}
    end
  end
  
  def new 
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company].permit(:name))
    if @company.save
      flash[:notice] = 'Company Created'
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update(params[:company].permit(:name))
      flash[:notice] = 'Company Updated'
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def check_admin
    authenticate_user!
    unless current_user.admin?
        flash[:alert] = "Must be admin to add or update a company"
        redirect_to companies_path
    end
  end
  
end
