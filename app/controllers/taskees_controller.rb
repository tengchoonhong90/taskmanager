class TaskeesController < ApplicationController

  helper_method :showStatus, :showNego, :promptIfBidded, :taskeeId, :changeFormMethodOnBid, :showBid, :bidType, :buttonIfBid, :showNavBar, :showUndoBid, :highlightCurrentPageOnNavBar, :changeValueOnSelectTaskee, :userSelected

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
      redirect_to taskee_path(@taskee)
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
