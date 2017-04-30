require 'rails_helper'

RSpec.describe WizardsController, type: :controller do
  describe 'GET #step2' do
    it 'assigns a proper address object' do
      session[:lead_attributes] = {
        address: '7331 E Bonita Dr, Scottsdale'
      }
      get :step2
      expect(assigns(:lat)).to eq(33.511537)
      expect(assigns(:lng)).to eq(-111.921993)
    end
  end
end
