class ChatroomController < ApplicationController
	before_action :require_login

	def index
		@messages = Message.order(created_at: :desc)
	end
end
