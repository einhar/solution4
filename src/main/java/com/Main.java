package com;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;
import javax.jms.*;
import java.io.IOException;

public class Main {

    private static String url = ActiveMQConnection.DEFAULT_BROKER_URL;
    private static String topicName = "topicExample.Library.Publication";
    private static String xmlPath = "src/main/resources/exercise-1.xml";

    public static void main(String[] args) throws JMSException {
        Connection connection = null;
        try {
            ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url);
            connection = connectionFactory.createConnection();
            connection.start();

            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

            Topic topic = session.createTopic(topicName);
            MessageProducer producer = session.createProducer(topic);

            String xmlString = Xml2String.executePath(xmlPath);
            TextMessage message = session.createTextMessage(xmlString);

            producer.send(message);

            session.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

}
