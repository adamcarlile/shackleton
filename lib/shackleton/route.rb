module Shackleton
  class Route
    extend Forwardable

    def_delegator :routes, :[]
    def_delegator :pattern, :expand

    def initialize(name: nil, path: nil, parent: nil, **options, &block)
      @name     = name
      @path     = path || name.to_s
      @options  = options
      @parent   = parent
      instance_exec self, &block if block_given?
    end
    
    def route(name, path=nil, **options, &block)
      routes[name.to_sym] = self.class.new(name: name, path: path, **options, &block)
    end

    def routes
      @routes ||= {}
    end

    def named_fragments
      @named_fragments ||= pattern.names.map(&:to_sym)
    end

    private

    def pattern
      @pattern ||= Mustermann.new(@path, type: :rails)
    end

  end
end
