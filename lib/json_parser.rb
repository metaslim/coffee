require 'json'

class JsonParser
  class << self
    def parse(json)
      JSON.parse(json)
    end
  end
end