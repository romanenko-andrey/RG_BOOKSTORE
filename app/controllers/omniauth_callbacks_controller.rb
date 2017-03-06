class OmniauthCallbacksController < Devise::OmniauthCallbacksController
     [:google, :facebook, :github].each do |provider|
     define_method "#{provider}" do
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) 
          sign_in @user, event: :authentication
          redirect_to root_path
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
     end
   end
end