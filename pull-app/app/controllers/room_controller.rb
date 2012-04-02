class RoomController < ApplicationController
	before_filter :authenticate_user!

	def send_msg
		@conversation = current_user.conversations.create({
			:message => params[:msg][:msg]
		}).build_response_msg

		respond_to do |format|
			format.js {}
		end
	end

	def check_msg
		respond_to do |format|
			format.js {render :text => Conversation.unread_msg(current_user.id).to_json}
		end
	end

end
