from kafka import KafkaConsumer

def consume_messages():
    consumer = KafkaConsumer(
        'my_topic',
        bootstrap_servers=['localhost:9092'],
        auto_offset_reset='earliest',
        enable_auto_commit=True,
        group_id='my-group'
    )

    for message in consumer:
        print(f"Received message: {message.value.decode('utf-8')}")
        # Process message here

if __name__ == "__main__":
    consume_messages()

 Explanation:

 - Purpose: Consumes and processes messages from a Kafka topic.
 - Key Libraries: kafka-python for Kafka consumer.
   
Functionality:

 - Connects to a Kafka broker.
 - Consumes messages from the specified topic.
 - Prints and processes each message.