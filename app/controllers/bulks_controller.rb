class BulksController < ApplicationController
  def index
  end

  def create
    if(params[:num].blank? || params[:num].to_i == 0)
      flash[:error] = "Invalid number to create"
      redirect_to bulks_path and return
    else
      Book.create_dummy_data(params[:num].to_i)
    end
  end

end
