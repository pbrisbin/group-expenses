module MethodOptions
  def self.included(base)
    base.extend(self)
  end

  def required(options, key)
    options.fetch(key) do
      raise ArgumentError, "#{key} is a required option"
    end
  end
end
