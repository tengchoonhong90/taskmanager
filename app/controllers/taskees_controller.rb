class TaskeesController < ApplicationController
	def index
    @tasks = Task.where.not(user_id: current_user.id)
    @taskees = Taskee.all
  end

  def show
    @taskee = Taskee.find(params[:id])
  end

  def new

  end

  def edit
    @task = Taskee.find(params[:id])
  end

  def create
    @taskee = Taskee.new(taskee_params)
    @taskee.user_id = current_user.id
    if @taskee.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @taskee = Taskee.find(params[:id])
    @taskee.user_id = current_user.id
    byebug
    @taskee.update(taskee_params)
    redirect_to taskees_path
  end

  def destroy
    @task = Taskee.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  private
  def taskee_params
    params.require(:taskee).permit(:task_id, :user_id, :bid)
  end
end
