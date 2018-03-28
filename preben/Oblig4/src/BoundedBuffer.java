//Løsning på oppg. 2 DAT103 Oblig 4, for Preben Bucher-Johannessen
import edu.princeton.cs.algs4.MaxPQ;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class BoundedBuffer {
    private static final int BUFFER_SIZE = 10;
    private static Semaphore mutex = new Semaphore(1);
    private static Semaphore empty = new Semaphore(BUFFER_SIZE);
    private static Semaphore full = new Semaphore(0);
    private static MaxPQ<Integer> buffer = new MaxPQ<>(BUFFER_SIZE);

    public static void main(String[] args) {
            new Producer().start();
            new Consumer().start();
            new Producer().start();
    }

    private static class Producer extends Thread{
        @Override
        public void run(){
            while (true){
                try{
                    int next_produced = new Random().nextInt(); //producing item for buffer
                    empty.acquire();                            //decreasing empty, waiting if all resources are being used i.e. 0
                    mutex.acquire();                            //acquiring access to buffer
                    buffer.insert(next_produced);                  //adding item to buffer
                    System.out.println("Produced one item to buffer.. size: "+ buffer.size());
                    mutex.release();                            //releasing resource
                    full.release();                             //increasing full
                    System.out.println("released lock, full size: " + full.availablePermits());
                    Thread.sleep(new Random().nextInt(2000));
                }
                catch (InterruptedException e){
                    e.printStackTrace();
                }
            }

        }
    }
    private static class Consumer extends Thread{
        @Override
        public void run(){
            while (true){
                try {
                    full.acquire();                             //decreasing full, if 0 waiting for resource
                    mutex.acquire();                            //acquiring access to resource
                    buffer.delMax();                            //removing item from buffer
                    System.out.println("Consumed one item from buffer.. size: " + buffer.size());
                    mutex.release();                            //releasing resource
                    empty.release();                            //increasing empty
                    System.out.println("released lock, full size: " + full.availablePermits());
                    Thread.sleep(new Random().nextInt(1000));
                }catch (InterruptedException e){
                    e.printStackTrace();
                }
            }

        }
    }


}
