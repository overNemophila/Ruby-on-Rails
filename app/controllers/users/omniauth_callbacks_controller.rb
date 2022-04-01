# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def line
    auth
  end

  def google_oauth2
    auth
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  private

  def auth
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      user_authentication = UserAuthentication.find_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      if user_authentication
        @user = user_authentication.user
      else
        @user = current_user || User.create!(
          email: @omniauth["info"]["email"] ? @omniauth["info"]["email"] : fake_email(@omniauth["uid"], @omniauth["provider"]),
          name: @omniauth["info"]["name"],
          password: Devise.friendly_token[0, 20],
        )
        @user.user_authentications.create!(
          provider: @omniauth["provider"],
          uid: @omniauth["uid"],
          token: @omniauth['credentials']['token'],
          token_expires_at: @omniauth['credentials']['expires_at'] ? Time.at(@omniauth['credentials']['expires_at']).to_datetime : nil,
          secret: @omniauth['credentials']['secret'],
          params: @omniauth['info'].to_hash,
        )
      end

      sign_in(:user, @user)
    end
    flash[:notice] = "ログインしました"
    redirect_to root_path
  end

  def fake_email(uid, provider)
    "#{uid}@#{provider}"
  end
end
