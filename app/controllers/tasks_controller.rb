class TasksController < ApplicationController
  
  def new
    # binding.pry
    @task = Task.new
  end

  def create

    @task = Task.new(task_params)
    if @task.save
      @task.list = @list
      flash[:success] = "Successfully created a new List"
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def delete_image
    @task = Task.find(params[:id])
    @task.image = nil
    @task.save
    redirect_to task_path(@task)
  end

  private

    def task_params
      params.require(:task).permit(:title,
                                   :notes,
                                   :status,
                                   :due_date,
                                   :start_date,
                                   :list_id,
                                   :image)
    end

end