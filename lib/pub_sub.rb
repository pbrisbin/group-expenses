require 'set'

module PubSub
  def subscribe(obj)
    listeners << obj
  end

  def publish(event, *args)
    listeners.each do |listener|
      if listener.respond_to?(event)
        listener.send(event, *args)
      end
    end
  end

  private

  def listeners
    @listeners ||= Set.new
  end
end
