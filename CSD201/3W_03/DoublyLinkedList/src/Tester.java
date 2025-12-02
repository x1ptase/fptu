import java.util.Scanner;

public class Tester {
    public static void main(String[] args) {
        MyDLL lst = new MyDLL();
        Scanner inp = new Scanner(System.in);
        String inputLine;
        
        System.out.print("Enter number of Cars: ");
        int n = 0;
        try {
            n = Integer.parseInt(inp.nextLine().trim());
        } catch (NumberFormatException e) {
            System.out.println("Invalid number of cars. Exiting.");
            return;
        }

        for (int i = 0; i < n; i++) {
            System.out.println("\n--- Car " + (i + 1) + " ---");
            
            System.out.print("ID: ");
            String id = inp.nextLine().trim();
            
            System.out.print("Brand: ");
            String brand = inp.nextLine().trim();
            
            String color;
            while (true) {
                System.out.print("Color (Red, Blue, White): ");
                color = inp.nextLine().trim();
                if (color.equalsIgnoreCase("Red") || 
                    color.equalsIgnoreCase("Blue") || 
                    color.equalsIgnoreCase("White")) {
                    break;
                } else {
                    System.out.println("Invalid color!!!! Color must be Red, Blue, or White.");
                }
            }
            
            int exp;
            while (true) {
                System.out.print("Exp (2020-2030): ");
                inputLine = inp.nextLine().trim();
                try {
                    exp = Integer.parseInt(inputLine);
                    if (exp >= 2020 && exp <= 2030) {
                        break;
                    } else {
                        System.out.println("Invalid exp!!1 Exp must be between 2020 and 2030.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid number!!!1 Please enter a valid year.");
                }
            }

            Car car = new Car(id, brand, color, exp);
            lst.addLast(car);
        }
        
        System.out.println("\n====== Before remove ======");
        lst.traverse();

        lst.removeFirstRed();
        lst.removeLastToyota();

        System.out.println("\n====== After remove ======");
        lst.traverse();

        lst.countByColor("Red"); 
        
        inp.close();
    }
}