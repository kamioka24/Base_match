class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    case resource
    when Player
      player_player_path(current_player)
    when Team
      team_team_path(current_team)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :player
       root_path
    when :team
       root_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when Player
       player_player_path(current_player)
    when Team
       team_team_path(current_team)
    end
  end

  # ゲストプレイヤーの削除、パスワード変更などを制限する。
  def check_guest
    email = resource&.email || params[:player][:email].downcase
    if email == "guest@example.com"
      redirect_to player_player_path(current_player), alert: "ゲストプレイヤーの変更・削除はできません。"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :member, :team_image, :introduction,
      :prefecture_code, :city, :street, :phone_number, :category, :email, :encrypted_password])
  end
end