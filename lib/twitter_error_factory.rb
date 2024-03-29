require_relative 'twitter_error/too_many_requests'

class TwitterErrorFactory
  def initialize(exception:)
    @exception = exception
  end

  def self.build(*args)
    new(*args).build
  end

  def build
    TwitterError.const_get(error).message(exception: exception)
  rescue NameError
    exception.to_s
  end

  protected

  attr_reader :exception

  private

  def error
    name.split('::').last
  end

  def name
    exception.class.to_s
  end
end
