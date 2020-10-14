module Legion::Extensions::Pagerduty::Helpers
  module Client
    def token(**opts)
      find_setting('token', opts)
    end

    def conn(**opts)
      # faraday persistant conn
    end
  end
end
