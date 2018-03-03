module Shackleton
  class Mapper

    def initialize &block
      @root = Shackleton::Route.new(&block)
    end

    def method_missing(method, *args, **kwargs, &block)
      return Shackleton::Builder.new.add_route(@root[method.to_sym], kwargs) if @root[method.to_sym]
      super
    end

  end
end
