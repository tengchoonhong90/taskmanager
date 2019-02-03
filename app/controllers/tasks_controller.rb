class TasksController < ApplicationController
  def index
    if user_signed_in?
      @tasks = Task.where(user_id: current_user.id)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new

  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    # render plain: @task.inspect
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    @task.update(task_params)
    redirect_to @tasks
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:task_name,:user_id, :task_description, :start_time, :price, :negotiable, :location)
  end
end
