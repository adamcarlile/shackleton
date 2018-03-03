require 'pry'
require 'mustermann'
require 'shackleton/extensions/hash_slice'
require "shackleton/version"

require 'shackleton/route'
require 'shackleton/mapper'
require 'shackleton/fragment'
require 'shackleton/builder'

module Shackleton
  module_function

  def mapper(&block)
    Shackleton::Mapper.new(&block)
  end
  
end

__END__


Shackleton.mapper do
  route :line, 'line(/:id)' do
    route :meta do
      route :modes
      route :severity
      route :disruption_categories, 'disruptioncategories'
      route :service_types, 'servicetypes'
    end
    route :mode, 'mode/:modes' do
      route :route
    end
    route :route do
      route :sequence, 'sequence/:direction' do
      end
    end
    route :status, 'status(/:start_date(/to/:end_date))'
    route :arrivals, 'arrivals/:stop_point'
  end
end
