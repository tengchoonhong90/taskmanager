class TaskeesController < ApplicationController
	def index
    @tasks = Task.where.not(user_id: current_user_id)
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
  def taskee_params
    params.require(:taskee).permit(:task_id, :user_id)
  end
end
