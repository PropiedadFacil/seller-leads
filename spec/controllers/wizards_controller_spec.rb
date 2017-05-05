require 'rails_helper'

RSpec.describe WizardsController, type: :controller do
  describe 'GET #step2' do
    it 'assigns a proper address object' do
      address = '7331 E Bonita Dr, Scottsdale'
      session[:lead_attributes] = {
        address: address
      }
      get :step2
      expect(assigns(:lat)).to eq(33.511537)
      expect(assigns(:lng)).to eq(-111.921993)
      expect(assigns(:formatted_address)).to include(address)
    end
  end
end
