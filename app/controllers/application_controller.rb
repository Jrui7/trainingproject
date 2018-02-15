class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :date_of_birth])
  end

  def after_sign_in_path_for(resource_or_scope)
    seeds_path
  end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
     def user_not_authorized
       flash[:alert] = "Erreur d'accès"
       redirect_to(seeds_path)
     end

    private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end



end
