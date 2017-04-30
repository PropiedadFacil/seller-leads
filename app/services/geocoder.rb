# Service object that parses the address
class Geocoder
  attr_reader :lat, :lng, :address
  def initialize(address)
    @address = address
  end

  def geocode
    return nil unless @address
    google_geocode
  end

  private

  def mapbox_geocode; end

  def google_geocode
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}
           &key=#{Figaro.env[:google_maps_key]}"
    response = JSON.parse(Faraday.get(url).body).with_indifferent_access
    return unless response[:status] != 'ZERO_RESULTS'
    location = response[:results][0][:geometry][:location]
    @lat = location[:lat]
    @lng = location[:lng]
  end
end
