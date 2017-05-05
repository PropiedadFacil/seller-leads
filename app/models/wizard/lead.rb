module Wizard
  module Lead
    STEPS = %w[step1 step2 step3 step4 step5].freeze

    # Base class for the form stems
    class Base
      include ActiveModel::Model
      attr_accessor :lead

      # Delegating every getter to the Lead
      delegate *::Lead.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :lead

      def initialize(lead_attributes)
        @lead = ::Lead.new(lead_attributes)
      end
    end

    # Start Step
    class Step1 < Base
      validates :address, presence: true
      validates :address, format: {
        with: /.,./,
        message: 'Please follow the example Ex. 746 E. Main ST, Scottsdale'
      }
    end

    # Location step
    class Step2 < Step1
      validates :address, :lat, :lng, presence: true
    end

    # Basic home information step
    class Step3 < Step2
      validates :bedrooms, :bathrooms, :built_surface,
                :pool_type, :kitchen_condition, :bathroom_condition,
                presence: true
    end

    class Step4 < Step2
      validates :address_1, presence: true
      validates :zip_code, presence: true
      validates :city, presence: true
      validates :country, presence: true
    end

    class Step5 < Step3
      validates :phone_number, presence: true
    end
  end
end
