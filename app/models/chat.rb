class Chat < ApplicationRecord

  has_many :items
  has_many :messages

  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

end
