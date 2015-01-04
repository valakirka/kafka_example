require 'poseidon'

class MyProducer
  def initialize
    partitioner = lambda { |key, partition_count|
      key.to_i % partition_count }
      
    @producer = Poseidon::Producer.new(
      ['localhost:9092'], self.class.name,
      partitioner: partitioner)
  end

  def send_message(body)
    message = Poseidon::MessageToSend.new(
      'mytopic',
      body, Time.now.to_i.to_s)

    @producer.send_messages([message])
  end
end
