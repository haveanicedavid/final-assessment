class TasksController < ApplicationController
  
  def new
    # binding.pry
    @task = Task.new
  end

  def create

    # @list = List.find(params[:list_id])

    @task = Task.new(task_params)
    if @task.save
      @task.list = @list
      flash[:success] = "Successfully created a new List"
      redirect_to task_path(@task)
      # redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

    def task_params
      params.require(:task).permit(:title, :notes, :status, :due_date, :start_date, :list_id)
    end

end