class Array
  def put
    puts self.join(" -> ")
  end
end
class City
  attr_accessor :name, :departures, :arrivals

  def initialize(name)
    @name = name
    @departures = []
    @visited = false
  end

  def next_destination

  end

  def add_departure(city)
    @departures << city
  end

  def ==(o)
    self.class == o.class && @name == o.name
  end

  def to_detail
    "#{@name}: #{@departures.map(&:name)}"
  end

  def to_s
    @name
  end
end

class Routes
  def initialize
    @visited = []
    @routes = []
    @route = []
    @cities = {}
  end

  def add_route(start_city, end_city)
    @cities[start_city] = City.new(start_city) unless @cities[start_city]
    @cities[end_city] = City.new(end_city) unless @cities[end_city]
    @cities[start_city].add_departure(@cities[end_city])
  end

  def calculate_routes(start_city, end_city)
    @start_city = @cities[start_city]
    @end_city = @cities[end_city]
    @route = []
    @visited.push @end_city
    route_city(@start_city)
    @routes.each { |r| r.put }
  end

  def to_s
    @cities.each { |k, v| puts v.to_detail }
  end

  private
  def route_city(city)
    @route << city
    city.departures.each do |departure|
      if departure == @end_city
        @routes << @route.push(@end_city).dup
        break
      end
      next if (@visited.include? departure) || (@route.include? departure)
      route_city(departure)
    end
    @visited << city
    @route.pop
  end
end

def add_data
  routes = Routes.new
  sample_data = [
      ["Seattle", "LA"],
      ["LA", "Florida"],
      ["LA", "Maine"],
      ["Florida", "Seattle"],
      ["Seattle", "Florida"],
      ["Seattle", "LV"],
      ["Seattle", "Chicago"],
      ["Seattle", "NY"],
      ["LV", "LA"],
      ["LV", "Florida"],
      ["LV", "NY"],
      ["LV", "Maine"],
      ["Maine", "Chicago"],
      ["NY", "LV"],
      ["Chicago", "NY"],
  ]
  sample_data.each do |a|
    routes.add_route(a[0], a[1])
  end
  puts routes
  return routes
end

#add_data
add_data.calculate_routes "Seattle", "Maine"
