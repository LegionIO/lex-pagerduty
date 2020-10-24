require 'legion/extensions/pagerduty/version'

module Legion
  module Extensions
    module Pagerduty
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
