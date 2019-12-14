class MessageBroadcastJob < ApplicationJob
	# Standart priority
	queue_as :default

	# What action to be performed
	def perform(message)
		# Broadcast the rendered message to the channel
		ActionCable.server.broadcast 'chatroom_channel', message: render_message(message)
	end

	private
	def render_message(message)
		# Render the message on the server the user details can't be obtained client side
		MessagesController.render partial: 'messages/message', locals: {message: message}
	end
end 