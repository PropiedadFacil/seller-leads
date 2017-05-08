# This controller is the one in charge of the flow of the form
class WizardsController < ApplicationController
  before_action :load_lead_wizard, except: %i[validate_step]

  def step2
    geocoder = Geocoder.new(@lead_wizard.lead.address)
    geocoder.geocode
    @lat = geocoder.lat
    @lng = geocoder.lng
    @formatted_address = geocoder.formatted_address
  end

  def step4
    if current_user
      params[:current_step] = 'step4'
      params[:lead_wizard] = @lead_wizard.lead.attributes
      params[:lead_wizard][:user_id] = current_user.id
      validate_step
    end
  end

  def validate_step
    current_step = params[:current_step]
    @lead_wizard = wizard_lead_for_step(current_step)
    @lead_wizard.lead.attributes = lead_wizard_params
    session[:lead_attributes] = @lead_wizard.lead.attributes
    # return render json: session[:lead_attributes]
    if @lead_wizard.valid?
      next_step = wizard_lead_next_step(current_step)
      create && return unless next_step
      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    if @lead_wizard.lead.save
      session[:lead_attributes] = nil
      redirect_to root_path, notice: 'Lead succesfully created!'
    else
      redirect_to(
        { action: Wizard::Lead::STEPS.first },
        alert: 'There were a problem when creating the lead.'
      )
    end
  end

  private

  def load_lead_wizard
    @lead_wizard = wizard_lead_for_step(action_name)
  end

  def wizard_lead_next_step(step)
    Wizard::Lead::STEPS[Wizard::Lead::STEPS.index(step) + 1]
  end

  def wizard_lead_for_step(step)
    raise InvalidStep unless step.in?(Wizard::Lead::STEPS)
    "Wizard::Lead::#{step.camelize}"
      .constantize
      .new(session[:lead_attributes])
  end

  def lead_wizard_params
    params.require(:lead_wizard)
          .permit(:email, :address, :lat, :lng, :bedrooms,
                  :bathrooms, :built_surface, :pool_type,
                  :kitchen_condition, :bathroom_condition, :renovated,
                  :renovated_spent, :renovated_description,
                  :user_id, :renovated_spent, :timeline_to_sell,
                  :looking_for_another, :reasons_for_selling,
                  :own_valuation, :anything_else,
                  characteristic_ids: [])
  end

  def well_formated_address(address)
    address.include?(',')
  end

  class InvalidStep < StandardError; end
end
