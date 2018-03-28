//Løsning på oppg 3 DAT103 Oblig 4, for Preben Bucher-Johannessen

import java.util.LinkedList;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class ReadersWriters {
    private static int read_count = 0;
    private static Semaphore mutex = new Semaphore(1);
    private static Semaphore rw_mutex = new Semaphore(1);
    private static LinkedList<Integer> database = new LinkedList<>();


    public static void main(String[] args) {
        new Writer().start();
        new Reader().start();
        new Reader().start();
        new Reader().start();
    }

    private static class Writer extends Thread{
        @Override
        public void run(){
            while (true){
                try{
                    int next_produced = new Random().nextInt(100);    //finding a number to write to database
                    rw_mutex.acquire();                            //asking for access to rw_mutex
                    database.addLast(next_produced);               //adding number to database
                    System.out.println("Wrote "+ database.getLast()+ " to database");
                    rw_mutex.release();                            //releasing resource
                    Thread.sleep(new Random().nextInt(2000));
                }
                catch (InterruptedException e){
                    e.printStackTrace();
                }
            }

        }
    }
    private static class Reader extends Thread{
        @Override
        public void run(){
            while (true){
                try {
                    mutex.acquire();                             //acquiring access to read from database
                    read_count++;
                    if (read_count==1) {
                        rw_mutex.acquire();
                        System.out.println("first reader access acquired..");
                    }
                    mutex.release();
                    System.out.println("Reading last number in database : " + database.peekLast());
                    Thread.sleep(new Random().nextInt(400));
                    System.out.println("Reading first number in database : " + database.peekFirst());
                    Thread.sleep(new Random().nextInt(400));
                    System.out.println("Reading random number in database : "+ database.get((Math.max(new Random().nextInt(database.size())-1,0))));
                    Thread.sleep(new Random().nextInt(400));
                    mutex.acquire();
                    read_count--;
                    if (read_count == 0){
                        rw_mutex.release();
                        System.out.println("last reader access released..");
                    }
                    mutex.release();                            //releasing resource
                    Thread.sleep(new Random().nextInt(1000));
                }catch (InterruptedException e){
                    e.printStackTrace();
                }
            }

        }
    }
}
