require 'poseidon'

class MyConsumer
  def initialize(offset)
    @consumer = Poseidon::PartitionConsumer.
      consumer_for_partition(self.class.name,
        ['localhost:9092'], 'mytopic', 0, offset)
  end

  def run
    loop do
      @consumer.fetch.each do |event|
        puts event.value
      end
    end
  end
end
