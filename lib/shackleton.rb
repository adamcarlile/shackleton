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
