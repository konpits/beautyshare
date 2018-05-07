class Profile < ApplicationRecord
  belongs_to :user


  def full_name user 
    Profile.find(user.id).first_name + " " + Profile.find(user.id).last_name 
  end
end
