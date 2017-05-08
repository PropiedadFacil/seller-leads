# Module to provide easy setup functions for each step
#  to avoid validation errors
module StepSetup
  def set_step3
    session = {
      lead_attributes: {
        address: '7331 E Bonita Dr,Scottsdale',
        lat: 39.123123,
        lng: -123.1234
      }
    }
    page.set_rack_session(session)
  end

  def set_step5
    set_step3
  end
end
