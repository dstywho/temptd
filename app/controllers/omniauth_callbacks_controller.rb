class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Welcome to TempTD, home of TempTD"
    else
      redirect_to new_user_registration_url
    end
  end
  alias_method :github, :all
end