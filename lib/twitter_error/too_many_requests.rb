module TwitterError
  class TooManyRequests
    def initialize(exception:)
      @exception = exception
    end

    def self.message(*args)
      new(*args).message
    end

    def message
      "#{self.class}: #{body}"
    end

    protected

    attr_reader :exception

    private

    def body
      "#{r.remaining}/#{r.limit} retry at #{r.reset_at}"
    end

    def rate_limit
      @rate_limit || exception.rate_limit
    end
    alias_method :r, :rate_limit
  end
end
