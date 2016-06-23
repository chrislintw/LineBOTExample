class Message < ActiveRecord::Base
  belongs_to :user
  enum action: %i(sent received)
end
