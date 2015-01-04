This is a small and simple example of Kafka consumers and producers using [Poseidon](https://github.com/bpot/poseidon) and [Poseidon Cluster](https://github.com/bsm/poseidon_cluster).

To try it out:

* Install and run [Kafka and ZooKeeper](http://kafka.apache.org/documentation.html#quickstart)

* Create the example topic with four partitions (depending on Kafka's version):

In Kafka 0.8.0:

      $ bin/kafka-create-topic.sh --zookeeper localhost:2181 --replica 1 --partition 4 --topic mytopic

  In Kafka 0.8.1:
  
      $ bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 4 --topic mytopic

* Open a ruby interpreter with `bundle exec irb`

* Require the producer, the consumer, and the consumer group files

* Use them! To test the consumer group, you can for example start two (or up to four) `MyConsumerGroup` instances, and check that a) messages are balanced between the instances, and b) each partition is consumed always by the same consumer instance.
```ruby
      consumer = MyConsumer.new(0)
      consumer.run

      group = MyConsumerGroup.new
      group.run

      producer = MyProducer.new
      producer.send_message('hola Madrid.rb')
```
