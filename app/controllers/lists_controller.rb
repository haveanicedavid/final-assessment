class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new 
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "Successfully created a new List"
      redirect_to lists_path
    else
      flash[:errors] = @list.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end

end