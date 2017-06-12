module Shackleton
  class Mapper

    def initialize &block
      @root = Shackleton::Route.new(&block)
    end

    def method_missing(method, *args, **kwargs, &block)
      if @root[method.to_sym]
        @root.send(method)
      else
        super
      end
    end

  end
end
