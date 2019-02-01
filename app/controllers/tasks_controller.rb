class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
    # render plain: @task.inspect
    @task.save
    redirect_to root_path
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
    params.require(:task).permit(:task_name, :task_description, :start_time, :price, :negotiable, :location)
  end
end
