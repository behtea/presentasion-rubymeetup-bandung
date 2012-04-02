class RoomController < ApplicationController
	before_filter :authenticate_user!

	def send_msg
		data = {:username => current_user.username,
			:msg => params[:msg][:msg],
			:avatar => current_user.avatar? ? current_user.avatar.url : "/noavatar.png",
			:time_msg => Time.now.strftime("%H:%M:%S"),
			:current_user_id => current_user.id
		}

		Juggernaut.publish("room", data)

		respond_to do |format|
			format.js {render :inline => "$('#chat-text').val('')"}
		end
	end
end
