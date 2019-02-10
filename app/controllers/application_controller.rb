class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def highlightCurrentPageOnNavBar(path)
		highlighted = '<li class="nav-item bg-success text-white font-weight-bold rounded ">'
		notHighlighted = '<li class="nav-item">'
		if request.url.include?(path)
			return highlighted.html_safe
		else 
			return notHighlighted.html_safe
		end
	end

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
		if task.confirmed === false && task.completed === false && task.incomplete === false
			return 'circles/open-circle.png'
		elsif task.confirmed === true && task.completed === false && task.incomplete === false
			return 'circles/closed-circle.png'
		elsif task.confirmed === true && task.completed === true && task.incomplete === false
			return 'circles/smiley-circle.png'
		elsif task.confirmed === true && task.completed === false && task.incomplete === true
			return 'circles/closed-circle-red.png'
		else
			return 'circles/open-circle.png'
		end
	end

	def showNego(status)
		notNegotiable = '<h5 class="card-text position-relative float-right titleFont text-white bg-dark rounded p-1 ml-3">'
		negotiable = '<h5 class="card-text position-relative float-right titleFont text-white bg-secondary rounded p-1 ml-3">'
		if status === true
			return negotiable.html_safe
		else
			return notNegotiable.html_safe
		end
	end

	def numberInterested(task)
		return @taskees.where(:task_id => task.id).length
	end

	def showBid(task)

		userHasBidded = @taskees.where(:task_id => task.id, :user_id => current_user.id)

		if userHasBidded.exists? === true
			return @taskees.select(:bid).where(:task_id => task.id, :user_id => current_user.id).first.bid
		else 
			return @tasks.select(:price).where(:id => task.id).first.price
		end

	end

	def promptIfBidded(task) 

		userHasBidded = @taskees.where(:task_id => task.id, :user_id => current_user.id)
		bidSum = showBid(task)
		bidSumCurrency = number_to_currency(bidSum).to_s

		bidded = '<strong class=" alert alert-warning d-inline-block">You have bidded ' + bidSumCurrency +'</strong>' 
		indicated = '<strong class=" alert alert-warning d-inline-block">You have indicated interest</strong>'

		if userHasBidded.exists? === true
			return task.negotiable === true ? bidded.html_safe : indicated.html_safe
		end
	end

	def userSelected(task) 

		userWasSelected = @taskees.where(:task_id => task.id, :user_id => current_user.id, :selected => true)

		if userWasSelected.exists? === true
			return true
		else
			return false
		end

	end


	def taskeeId(task)

		checkTaskeeId = @taskees.where(:task_id => task.id, :user_id => current_user.id)
		getTaskeeId = @taskees.select(:id).where(:task_id => task.id)

		if checkTaskeeId.exists? === true
			return "/taskees/" + getTaskeeId.first.id.to_s
		else
			return "/taskees/"
		end

	end

	def editTaskeeId(task)

		checkTaskeeId = @taskees.where(:task_id => task.id, :user_id => current_user.id)
		getTaskeeId = @taskees.select(:id).where(:task_id => task.id)

		if checkTaskeeId.exists? === true
			return "/taskees/" + getTaskeeId.first.id.to_s
		else
			return "/taskees/"
		end

	end

	def changeFormMethodOnBid(task)

		newBid = '<input name="_method" type="hidden" value="patch" />'
		undoInterest = '<input name="_method" type="hidden" value="delete" />'

		if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? === true
			return task.negotiable === true ? newBid.html_safe : undoInterest.html_safe
		end

	end

	def showSelectedTaskeeCard(status)
		selectedBackground = '<div class="card-body bg-light">'
		normalBackground = '<div class="card-body bg-white" >'
		return status === true ? selectedBackground.html_safe : normalBackground.html_safe
	end

	def changeValueOnSelectTaskee(status)
		return status === true ? false : true
	end

	def changeButtonOnSelectTaskee(status)
			unselect=	
				'value="Un-select"  
				class="btn btn-warning titleFont grow"'
			select=
				'value="Select"  
				class="btn btn-success titleFont grow"'
		return status === true ? unselect.html_safe : select.html_safe
	end

	def changeValueOnConfirmTask(status)
		return status === true ? false : true
	end

	def changeButtonOnConfirmTask(status)
		return status === true ? "Un-Confirm" : "Confirm"
	end

	def bidType(task)
		return task.negotiable ? "number" : "hidden"
	end

	def showUndoBid(task)
		userHasBidded = @taskees.where(:task_id => task.id, :user_id => current_user.id)
		if task.negotiable != true 
			return "hidden" 
		elsif userHasBidded.exists? != true
			return "hidden"
		end
	end

	def buttonIfBid(task) 

		indicatedForNotNegotiable = '<input type="submit" name="commit" value="Undo Indication" data-disable-with="Save Task" class="btn btn-warning titleFont grow">'
		notNegotiable = '<input type="submit" name="commit" value="Indicate Interest" data-disable-with="Save Task" class="btn btn-success titleFont grow">'
		bidded = '<input type="submit" name="commit" value="Change Bid ($)" data-disable-with="Save Task" class="btn btn-success titleFont grow">'
		notBidded = '<input type="submit" name="commit" value="Bid for Task ($)" data-disable-with="Save Task" class="btn btn-success titleFont grow">'

		userHasBidded = @taskees.where(:task_id => task.id, :user_id => current_user.id)

		if task.negotiable === true
			if @taskees.where(:task_id => task.id, :user_id => current_user.id).exists? === true
				return bidded.html_safe
			else
				return notBidded.html_safe
			end
		else
			if userHasBidded.exists? === true
				return indicatedForNotNegotiable.html_safe
			else
				return notNegotiable.html_safe
			end
		end

	end

	def successfulSelection(task)
		return task.confirmed && userSelected(task)
	end

	def cardBackgroundColor(colour)

		greenBG = "background-color: #ebffeb; border-color: #c4ffc4;"
		yellowBG = "background-color: #ffffeb; border-color: #ffffb0;"
		redBG = "background-color: #ffebeb; border-color: #ffd8d8;"

		green = "border-color: rgba(0, 59, 0, 0.2);"
		orange = "border-color: rgba(255, 191, 0, 0.2);"
		red = "border-color: rgba(118, 0, 0, 0.2);"

		if colour === "green"
			return green
		elsif colour === "red"
			return red
		elsif colour === "orange"
			return orange
		end
	end

	def changeTaskeeCardBackground(task)

		userHasBidded = @taskees.where(:task_id => task.id, :user_id => current_user.id)

		if successfulSelection(task) === true
			return cardBackgroundColor("green")
		elsif task.confirmed === true && userSelected(task) === false
			return cardBackgroundColor("red")
		elsif userHasBidded.exists? === true
			return cardBackgroundColor("orange")
		end
	end

	def changeTaskCardBackground(task)

		if task.confirmed === true && task.completed === false && task.incomplete === false
			return cardBackgroundColor("orange")
		elsif task.confirmed === true && task.completed === true && task.incomplete === false
			return cardBackgroundColor("green")
		elsif task.confirmed === true && task.completed === false && task.incomplete === true
			return cardBackgroundColor("red")
		end

	end

	def taskStatusUpdate(task)
		if task.confirmed === true && task.completed === true && task.incomplete === false
			return "completed"
		elsif task.confirmed === true && task.completed === false && task.incomplete === true
			return "incomplete"
		else 
			return "showInterestedParties"
		end
	end

end