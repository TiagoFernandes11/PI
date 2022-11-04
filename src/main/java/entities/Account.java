/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.util.Scanner;

/**
 *
 * @author rafae
 */
public class Account {
    
    private int id;
    private String name;
    private Double balance;
    private Scanner sc = new Scanner(System.in);
    
    public Account(){
        System.out.print("Enter the account Number: ");
        this.id = sc.nextInt();
        sc.nextLine();
        
        System.out.print("Enter the account's holder name: ");
        setName(sc.nextLine());
        
        System.out.println("Do you want to do an inicial deposit ? (Y/N)");
        String resp = sc.nextLine();
        
        if(resp.toLowerCase().contains("y")){
            System.out.print("Enter initial deposit: ");
            this.balance = sc.nextDouble();
        }
        else this.balance = 0.00;
    }

    public Account(int id, String name, Double saldo) {
        this.id = id;
        this.name = name;
        this.balance = saldo;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    private void setName(String name) {
        this.name = name;
    }
    
    public Double getBalance() {
        return this.balance;
    }
    
    public void deposit(){
        System.out.print("Enter deposit value: ");
        this.balance += sc.nextDouble();
        accountData();
    }
    
    public void withdraw(){
        System.out.println("Enter withdraw value: ");
        Double withdrawValue = sc.nextDouble();
        if(withdrawValue <= getBalance() + 5){
            this.balance -= withdrawValue + 5.00;
            System.out.println("");
            accountData();
        }
        System.out.println("Invalid value: Insuficient resources.");
        
    }
    
    public void accountData(){
        System.out.println("Account Data:"
                + " \n"
                + "Account "
                + getId()
        + ", Holder: "
                + getName()
        + ", Balance: $ "
                + getBalance() 
        + "\n");
        
        
    }
    
    public void quitAccount(){
        sc.close();
        System.out.println("Quiting...");
    }
}
