class TasksController < ApplicationController

  helper_method :showStatus, :showNego, :numberInterested, :showNavBar, :highlightCurrentPageOnNavBar, :taskeeId, :changeValueOnSelectTaskee, :changeButtonOnSelectTaskee, :changeValueOnConfirmTask, :changeButtonOnConfirmTask, :showSelectedTaskeeCard

  def index

  end

  def tasks
    if user_signed_in?
      @tasks = Task.where(user_id: current_user.id)
      @taskees = Taskee.all
    end
  end

  def show
    @task = Task.find(params[:id])
    @taskees = Taskee.where(:task_id => params[:id])
    # byebug
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
    # redirect_to tasks_path
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  def map
    gon.locations = Task.all
  end

  private
  def task_params

    params.require(:task).permit(:task_name,:user_id, :task_description, :start_time, :price, :negotiable, :location, :confirmed, :completed, :incomplete, :longitude, :latitude)

  end


end
