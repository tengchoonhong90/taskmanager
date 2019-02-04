class TaskeesController < ApplicationController

  helper_method :showStatus, :showNego, :promptIfBidded, :taskeeId, :patchMethod, :showBid, :bidType, :buttonIfBid, :showNavBar

	def index

    if params.has_key?(:id)
      @taskees = Taskee.where(id: params[:id] )
      @tasks = Task.where(id: @taskees.first.task_id)
    else
      @tasks = Task.where.not(user_id: current_user.id)
      @taskees = Taskee.all
    end
    
  end

  # def show
  #   @taskee = Taskee.find(params[:id])
  # end

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
    @taskee.update(taskee_params)
    redirect_to taskee_path
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
