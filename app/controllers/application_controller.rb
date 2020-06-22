class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
        case resource
        when :player
        	 player_player_path
        when :team
        	 team_team_path
        end
    end

    def after_sign_out_path_for(resource)
        case resource
        when :player
        	 player_root_path
        when :team
        	 team_home_about_path
        end
    end

    def after_sign_up_path_for(resource)
        case resource
        when :player
        	 player_player_path
        when :team
        	 team_team_path
        end
    end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :member, :team_image, :introduction,
			:prefecture_code, :city, :street, :phone_number, :category, :email, :encrypted_password])
	end
end
