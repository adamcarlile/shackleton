module Shackleton
  class Fragment
    extend Forwardable

    def_delegator :@route, :[]

    def initialize(route, arguments)
      @route = route
      @arguments = arguments
    end

    def call
      @route.expand(arguments)
    end

    def arguments
      @arguments.slice(*@route.named_fragments)
    end

    def query_params
      @arguments.except(*@route.named_fragments)
    end

  end
end