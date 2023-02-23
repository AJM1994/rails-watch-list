class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "List was succesfully created"
    else
      render :new, status: :unprocessable_entity
    end
    # redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
