# Service object that parses the address
class Geocoder
  attr_reader :lat, :lng, :address, :formatted_address
  def initialize(address)
    @address = address
  end

  def geocode
    return nil unless @address
    google_geocode
    parse_google_response
  end

  private

  def mapbox_geocode; end

  def google_geocode
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}
           &key=#{Figaro.env[:google_maps_key]}"
    @response = JSON.parse(Faraday.get(url).body).with_indifferent_access
  end

  def parse_google_response
    return unless @response[:status] != 'ZERO_RESULTS'
    location = @response[:results][0][:geometry][:location]
    @lat = location[:lat]
    @lng = location[:lng]
    @formatted_address = @response[:results][0][:formatted_address]
                         .remove(', USA')
  end
end
