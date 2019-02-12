class TaskeesController < ApplicationController

  helper_method :showStatus, :showNego, :promptIfBidded, :taskeeId, :changeFormMethodOnBid, :showBid, :bidType, :buttonIfBid, :showNavBar, :showUndoBid, :highlightCurrentPageOnNavBar, :changeValueOnSelectTaskee, :userSelected, :successfulSelection, :changeTaskeeCardBackground, :modalDataTarget

  include ActionView::Helpers::NumberHelper

	def index

    gon.tasker = current_user.username

    @chats = Chat.all
    @chat = Chat.new

    @tasks = Task.where.not(user_id: current_user.id)
    @taskees = Taskee.all

  end

  def show

    @tasks = Task.where(id: params[:id])
    @taskees = Taskee.where(task_id: params[:id], user_id: current_user.id )
    
    
    gon.tasker = current_user.username
    gon.taskId = params[:id]

    @chats = Chat.where(:task_id => params[:id]).order(:created_at)
    @chat = Chat.new

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
      redirect_to taskees_path
    else
      render 'new'
    end 
  end

  def update
    @taskee = Taskee.find(params[:id])
    # @taskee.user_id = current_user.id
    @taskee.update(taskee_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @taskee = Taskee.find(params[:id])
    @taskee.destroy

    redirect_to taskees_path
  end

  private
  def taskee_params
    params.require(:taskee).permit(:task_id, :user_id, :bid, :selected, :done)
  end
end
