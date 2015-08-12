class TasksController < ApplicationController
  respond_to :json
  
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

  def destroy
    @task = Task.find(params[:id])
    @list = @task.list
    @task.destroy
    redirect_to list_path(@list)
  end

  def delete_image
    @task = Task.find(params[:task_id])
    @task.image = nil
    @task.save
    redirect_to task_path(@task)
  end

  def update_status
    @task = Task.find(params[:task_id])
    @task.status = params[:status].to_i
    
    if @task.save
      respond_with @task
    else
      respond_with({:errors => @task.errors }, :status => 422, :location => tasks_path)
    end
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