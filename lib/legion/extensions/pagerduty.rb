require 'legion/extensions/pagerduty/version'
require 'pagerduty'

module Legion
  module Extensions
    module Pagerduty
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
