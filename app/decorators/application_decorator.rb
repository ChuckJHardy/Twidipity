class ApplicationDecorator < SimpleDelegator
  def self.decorate(obj)
    new(obj)
  end

  def self.to_proc
    ->(obj) { self.decorate(obj) }
  end
end
