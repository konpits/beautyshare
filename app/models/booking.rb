class Booking < ApplicationRecord
  belongs_to :consultant, :class_name => 'User'
  belongs_to :consumer, :class_name => 'User'
  belongs_to :service
end
