module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)
      resource.save

      if resource.persisted?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        #TODO: We need to do something useful with all the flash messages
        flash[:error] = resource.errors.messages
        redirect_to stored_location_for(resource)
      end
    end
  end
end
