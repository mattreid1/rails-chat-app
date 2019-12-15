# Created each time a client connect to the chatroom
class ChatroomChannel < ApplicationCable::Channel
	# Ran when a client subscribes
	def subscribed
		stream_from "chatroom_channel"
		puts current_user.email + " connected"
	end

	# Ran when a client disconnects/unsubscribes
	def unsubscribed
	end

	# Creates new Message model to be saved to database
	def rx_message(data)
		# Get the current user from connection.rb and then create the Message
		current_user.messages.create(content: data['message'], to_id: nil) # Nil means the global chatroom
	end
end  