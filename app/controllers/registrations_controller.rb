class RegistrationsController < Devise::RegistrationsController
  protected


  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end
end
