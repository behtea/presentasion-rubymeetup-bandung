class Conversation < ActiveRecord::Base
	belongs_to :user

	def self.unread_msg(user_id)
		msg = where(["read = ? AND user_id != ? ", false, user_id])
		unread = ""
		unless msg.nil?
			unread = []
			msg.each do |m|
				unread << m.build_response_msg
				m.update_attribute("read", true)
			end
		end
		unread
	end

	def build_response_msg
		{
			:username => user.username,
			:msg => message,
			:avatar => user.avatar? ? user.avatar.url : "/noavatar.png",
			:time_msg => created_at.strftime("%H:%M:%S"),
			:current_user_id => user.id
		}
	end

end
