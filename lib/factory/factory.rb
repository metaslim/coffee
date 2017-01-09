require 'json'

class Factory
  class << self
    def create_from(json)
      generate(json)
    end

    private

    def generate(json)
      raise NotImplementedError
    end

    def parse(json)
      items_array = JSON.parse(json)
      items_array.each do |item|
        yield(item) if block_given?
      end

    end
  end

end