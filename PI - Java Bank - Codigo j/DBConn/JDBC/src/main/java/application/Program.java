/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author rafae
 */
public class Program {
    public static void main(String[] args) {
         try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from v_relatorio_conta");
            while(rs.next()){
                System.out.println("Proprietario da conta: "+
                        rs.getString("proprietario da conta") +
                        " -//- ID da conta: "+
                        rs.getString("id da conta")+
                        " -//- Saldo atual: "+
                        rs.getFloat("saldo atual")
                );
            }  
        } catch (SQLException ex) {
            System.out.println("A conexão com o banco falhou: " + ex.getMessage());
        }
    }
    
    public static void closeConn(Connection conexao){
        try {
            conexao.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar conexão: " + ex.getMessage());
        }
    }
}
