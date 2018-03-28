import java.io.*;
import java.util.*;

interface Channel
{
	// Send a message to the channel
	public abstract void send(Object item);

	// Receive a message from the channel
	public abstract Object receive();
}

class MessageQueue implements Channel
{
	private Vector queue;

	public MessageQueue() {
		queue = new Vector();
	}

	// This implements a nonblocking send
	public void send(Object item) {
		queue.addElement(item);
	}

	// This implements a nonblocking receive
	public Object receive() {
		if (queue.size() == 0)
			return null;
		else
			return queue.remove(0);
	}
}

public class ProducerConsumer
{
	public static void main(String args[])
	{
		Channel mailBox = new MessageQueue();
	
		while (true) {
			Date message = new Date();
			mailBox.send(message);

			message = (Date) mailBox.receive();

			System.out.println("got: " + message);
		}
	}
}
