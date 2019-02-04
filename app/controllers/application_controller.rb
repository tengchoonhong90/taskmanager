class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	# def index
	# 	render '/index.html.erb'
	# end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :phone])
  end

  	def showNavBar
  		if user_signed_in?
			render template: "components/navbarLoggedIn"
		else
			render template: "components/navbarNewUser"
		end
	end

	def showStatus(task)
		if task.confirmed == false && task.completed == false && task.incomplete==false
			return 'circles/open-circle.png'
		elsif task.confirmed == true && task.completed == false && task.incomplete==false
			return 'circles/closed-circle.png'
		elsif task.confirmed == true && task.completed == true && task.incomplete==false
			return 'circles/smily-circle.png'
		else
			return 'circles/closed-circle-red.png'
		end
	end

	def showNego(status)
		if status == true
			return '(Price Negotiable)'
		end
	end

	def numberInterested(task)
		return @taskees.where(:task_id => task.id).length
	end

	def promptIfBidded(task) 
		bidded = '<strong class=" alert alert-warning d-inline-block">You have already bidded</strong>' 
		indicated = '<strong class=" alert alert-warning d-inline-block">You have indicated interest.</strong>'
		if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
			if task.negotiable != true
				return indicated.html_safe
			else
				return bidded.html_safe
			end
		end
	end

	def taskeeId(task)
		if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
			return "/taskees/" + @taskees.select(:id).where(:task_id => task.id).first.id.to_s
		else
			return "/taskees/"
		end
	end

	def changeFormMethod(task)
		newBid = '<input name="_method" type="hidden" value="patch" />'
		undoInterest = '<input name="_method" type="hidden" value="delete" />'
		if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
			if task.negotiable == true
				return newBid.html_safe 
			else
				return undoInterest.html_safe
			end
		end
	end

	def showBid(task)
		if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
			return @taskees.select(:bid).where(:task_id => task.id, :user_id => current_user.id).first.bid
		else 
			return @tasks.select(:price).where(:id => task.id).first.price
		end
	end

	def bidType(task)
		if task.negotiable == true
			return "number"
		else
			return "hidden"
		end
	end

	def buttonIfBid(task) 
		indicatedForNotNegotiable = '<input type="submit" name="commit" value="Undo Indication" data-disable-with="Save Task" class="btn btn-success logoFont">'
		notNegotiable = '<input type="submit" name="commit" value="Indicate Interest" data-disable-with="Save Task" class="btn btn-success logoFont">'
		bidded = '<input type="submit" name="commit" value="Change Bid" data-disable-with="Save Task" class="btn btn-success logoFont">'
		notBidded = '<input type="submit" name="commit" value="Bid for Task" data-disable-with="Save Task" class="btn btn-success logoFont">'
		if task.negotiable != true
			if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
				return indicatedForNotNegotiable.html_safe
			else
				return notNegotiable.html_safe
			end
		else
			if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? == true
				return bidded.html_safe
			else
				return notBidded.html_safe
			end
		end
	end


end