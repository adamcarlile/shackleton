require "shackleton/version"

require 'shackelton/route'
require 'shackelton/mapper'

module Shackleton
  module_function

  def mapper(&block)
    Shackleton::Mapper.new(&block)
  end
  
end

__END__


Shackleton.mapper do
  route :line do
    route :id, ':id'
  end
end