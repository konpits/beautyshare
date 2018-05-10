class RegistrationsController < Devise::RegistrationsController

    def after_sign_up_path_for(*)
      new_profile_path # Or :prefix_to_your_route
    end

    def after_inactive_sign_up_path_for(*) 
        new_profile_path # Or :prefix_to_your_route
    end
end
