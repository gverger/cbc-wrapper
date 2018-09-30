module CbcWrapper
  def self.root
    File.dirname __dir__
  end
end

require File.expand_path('cbc-wrapper/version', __dir__)
require File.expand_path('cbc-wrapper/ffi', __dir__)
