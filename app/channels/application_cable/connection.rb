# Created application wide each time a client connects
module ApplicationCable
	class Connection < ActionCable::Connection::Base
		# Modified from https://api.rubyonrails.org/classes/ActionCable/Connection/Base.html
		identified_by :current_user

		# Verify user on connect
		def connect
			@current_user = find_verified_user
		end
		
		# Ran when a user disconnects
		def disconnect
		end

		private
		
		def find_verified_user
			if get_remember_token.present? # If user is authenticated
				# If current_user null, get the user or reject the connection
				@current_user = get_user_from_remember_token(get_remember_token) || reject_unauthorized_connection
			end
			@current_user
		end

		# Get the Clearance remember token from cookie
		def get_remember_token
			ActionDispatch::Request.new(@env).cookie_jar[Clearance.configuration.cookie_name]
		end

		# Check the remember token with Clearance using the User model
		def get_user_from_remember_token(token)
			Clearance.configuration.user_model.find_by(remember_token: token)
		end
	end
end