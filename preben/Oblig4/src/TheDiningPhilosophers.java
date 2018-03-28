//Løsning på oppg 4 DAT103 Oblig 4, for Preben Bucher-Johannessen
import java.util.concurrent.Semaphore;

public class TheDiningPhilosophers {
    private static Semaphore[] chopsticks = new Semaphore[5];


    public static void main(String[] args) {
        for (int i = 0; i < chopsticks.length; i++) {
            chopsticks[i] = new Semaphore(1);
        }
        Philosopher p1 = new Philosopher(0);
        p1.start();
        Philosopher p2 = new Philosopher(1);
        p2.start();
        Philosopher p3 = new Philosopher(2);
        p3.start();
        Philosopher p4 = new Philosopher(3);
        p4.start();
        Philosopher p5 = new Philosopher(4);
        p5.start();

    }

    private static class Philosopher extends Thread {
        int numb;

        public Philosopher(int numb) {
            this.numb = numb;
        }

        @Override
        public void run() {
            while (true) {
                try {
                    if (numb%2==0){                               //odd philosophers ask for left chopstick first
                        chopsticks[numb].acquire();                   //asking for access to first chopstick
                        chopsticks[(numb + 1) % 5].acquire();         //asking for access to second chopstick
                    } else{
                        chopsticks[(numb + 1) % 5].acquire();
                        chopsticks[numb].acquire();
                    }
                    System.out.println("Philosopher " + numb + " is eating.. ");
                    chopsticks[numb].release();                         //releasing chopstick
                    chopsticks[(numb + 1) % 5].release();                   //releasing chopstick 2
                    System.out.println("Philosopher " + numb + " is thinking.... ");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

        }
    }
}