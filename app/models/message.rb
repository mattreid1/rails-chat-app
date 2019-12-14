class Message < ApplicationRecord
	# Each Message belongs to a user
	belongs_to :user

	# Require message content to be present
	validates :content, presence: true

	# Once message has been saved, broadcast it
	after_create_commit :broadcast_message

	private

	def broadcast_message
		MessageBroadcastJob.perform_later(self)
	end
end
