class ChatroomController < ApplicationController
	def index
		# Only get messages to nil, the global chatroom
		@messages = Message.where(to_id: nil).order(created_at: :desc)
	end
end
