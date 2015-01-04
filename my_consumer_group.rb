require 'poseidon'
require 'poseidon_cluster'

class MyConsumerGroup
  def initialize
    @group = Poseidon::ConsumerGroup.new(
      self.class.name, ['localhost:9092'],
      ['localhost:2181'], 'mytopic')
  end

  def run
    @group.fetch_loop do |partition, messages|
      messages.each { |m| puts "Message for partition #{partition} received: #{m.value}" }
    end
  end
end
