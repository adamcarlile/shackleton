module Shackleton
  module Extensions
    module HashSlice 
      def slice(*keys)
        ::Hash[[keys, self.values_at(*keys)].transpose]
      end
      def except(*keys)
        desired_keys = self.keys - keys
        ::Hash[[desired_keys, self.values_at(*desired_keys)].transpose]
      end
    end
  end
end
Hash.include Shackleton::Extensions::HashSlice