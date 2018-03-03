module Shackleton
  class Builder
    extend Forwardable

    def_delegator :build, :to_s

    def stack 
      @stack ||= []
    end

    def build
      [stack.map(&:call).compact.join('/').gsub(%r{/+}, '/'), query_params].reject(&:empty?).join("?")
    end

    def add_route(route, kwargs)
      stack << Shackleton::Fragment.new(route, kwargs)
      self
    end

    def query_params
      URI.encode_www_form(Hash[*stack.map {|x| x.query_params.to_a}.flatten])
    end

    def method_missing(method, *args, **kwargs, &block)
      return self.add_route(stack.last[method.to_sym], kwargs) if stack.last[method.to_sym]
      super
    end

  end
end
