class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
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

  def list_params
    params.require(:list).permit(:name)
  end
end
