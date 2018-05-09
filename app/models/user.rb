class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :consulted_bookings, :class_name => 'Booking', :foreign_key => 'consultant_id'
  has_many :consumed_bookings, :class_name => 'Booking', :foreign_key => 'consumer_id'
  has_one :profile
end
