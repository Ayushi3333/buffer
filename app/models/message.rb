class Message < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
  belongs_to :chatroom
end
