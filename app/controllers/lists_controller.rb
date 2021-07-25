class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  def show
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new
    @list.update(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = "You have successfully delete the list #{@list.name}."
    redirect_to root_url
  end

  def set_list
    @list = List.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
