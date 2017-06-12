module Shackleton
  class Route

    delegate :[], to: :routes

    def initialize(name=nil, fragment=nil, **options, &block)
      @name = name
      @fragment = fragment
      @options = options
      instance_exec self, &block if block_given?
    end

    def fragment
      fragment || name.to_s
    end
    
    def route(name, fragment=nil, **options, &block)
      routes[name.to_sym] = self.class.new(name: name, fragment: fragment, **options, &block)
    end

    def routes
      @routes ||= {}
    end

  end
end
