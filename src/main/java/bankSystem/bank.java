package bankSystem;


import entities.Account;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author rafae
 */
public class bank {
    public static void main(String[] args) {
        System.out.println("Welcome to Java's Bank");
        
        System.out.println("Starting process of creating an account...");
        
        Account conta = new Account();
        
        conta.accountData();
        
        conta.deposit();
        
        conta.withdraw();
        
        conta.quitAccount();
    }
}
