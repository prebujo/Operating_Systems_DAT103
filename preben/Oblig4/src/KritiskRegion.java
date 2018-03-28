//Løsning på oppg 1 f) i DAT103 Oblig 4, for Preben Bucher-Johannessen

import java.util.concurrent.Semaphore;

public class KritiskRegion {
    static Semaphore semaphore = new Semaphore(1);
    static class KritiskRegThread extends Thread {
        String name = "";
        KritiskRegThread(String name){
            this.name = name;
        }
        public void run() {
            while (true) {
                try {
                    System.out.println(name + " : attempting to aquiring resource..");
                    System.out.println(name + " : available resources now: " + semaphore.availablePermits());
                    semaphore.acquire();
                    System.out.println(name + " : got the resource! ");
                    try {
                        for (int i = 1; i <= 2; i++) {
                            System.out.println(name + " : is using resource " + i + ", available resources: " + semaphore.availablePermits());
                            Thread.sleep(1000);
                        }
                    } finally {
                        System.out.println(name + " : releasing resource...");
                        semaphore.release();
                        System.out.println(name + " : available resources now: " + semaphore.availablePermits());
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public static void main(String[] args){
        System.out.println("Total available Semaphores permits : "+ semaphore.availablePermits());
        KritiskRegThread t1 = new KritiskRegThread("A");
        t1.start();
        KritiskRegThread t2 = new KritiskRegThread("B");
        t2.start();
        KritiskRegThread t3 = new KritiskRegThread("C");
        t3.start();
        KritiskRegThread t4 = new KritiskRegThread("D");
        t4.start();
    }

}
