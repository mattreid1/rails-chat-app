# On DOM Content and Turbolinks loaded
jQuery(document).on 'turbolinks:load', ->
	$messages = $('#messages') # List of messages
	$msg_form = $('#msg_new') # Message submission form
	$msg_content = $msg_form.find('#msg_content') # Message submission content

	App.chat = App.cable.subscriptions.create {
			channel: "ChatroomChannel"
		},

		connected: ->
			console.log "Connected"

		disconnected: ->
			console.log "Disconnected"

		# Received anything from the server
		received: (data) ->
			if data['message'] # If the data is a new message
				$messages.prepend data['message'] # Add new message to view

		# Send message up to server
		send_message: (message) ->
			@perform 'rx_message', message: message

	$msg_form.submit (e) ->
		if !App.chat.consumer.connection.disconnected
			msg_content = $.trim($msg_content.val()) # Remove whitespace

			if msg_content.length > 0 # If message has content
				$msg_content.val('') # Clear message box
				App.chat.send_message msg_content # Send it

			# Can't return null without client side error
			return false