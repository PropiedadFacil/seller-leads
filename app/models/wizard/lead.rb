module Wizard
  module Lead
    STEPS = %w[step1 step2 step3 step4].freeze

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

    # Location step
    class Step1 < Base
      validates :address, :lat, :long, presence: true
    end

    class Step2 < Step1
      validates :first_name, presence: true
      validates :last_name, presence: true
    end

    class Step3 < Step2
      validates :address_1, presence: true
      validates :zip_code, presence: true
      validates :city, presence: true
      validates :country, presence: true
    end

    class Step4 < Step3
      validates :phone_number, presence: true
    end
  end
end
