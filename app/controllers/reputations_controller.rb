class ReputationsController < ApplicationController

	def index

	end

	def show
		@reputations = reputation.all
	end

	def new

	end

	def edit
		# @task = reputation.find(params[:id])
	end

	def create
		@reputation = reputation.new(reputation_params)
		# @reputation.user_id = current_user.id
		if @reputation.save
			redirect_back(fallback_location: root_path)
		else
			render 'new'
		end 
	end

	def update
	# @reputation = reputation.find(params[:id])

	# @reputation.update(reputation_params)
	# redirect_back(fallback_location: root_path)
	end

	# def destroy
	#   @reputation = reputation.find(params[:id])
	#   @reputation.destroy

	#   redirect_to reputations_path
	# end

	private
	def reputation_params
		params.require(:reputation).permit(:user_id, :rep)
	end

end