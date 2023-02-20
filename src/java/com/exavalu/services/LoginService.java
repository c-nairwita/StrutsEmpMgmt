/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Country;
import com.exavalu.models.District;
import com.exavalu.models.Province;
import com.exavalu.models.Users;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.apache.log4j.Appender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author Avijit Chattopadhyay
 */
public class LoginService {
    
    public static LoginService loginService = null;
    
    private LoginService(){}
    
    public static LoginService getInstance()
    {
        if(loginService==null)
        {
            return new LoginService();
        }
        else
        {
            return loginService;
        }
    }
    
    public boolean doLogin(Users user)
    {
        boolean success = false;
        
        String sql = "Select * from users where emailAddress=? and password=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmailAddress());
            ps.setString(2, user.getPassword());
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = true;
            }
            
        } catch (SQLException ex) {
            int errorVal = ex.getErrorCode();
            System.out.println(errorVal);
        }
        
        
        return success;
    }
    
    public boolean doSignUp(Users user) {
        
        boolean result=false;
        String sql ="INSERT INTO users(emailAddress,password,firstName,lastName,status,countryCode,stateCode,districtCode)" + "VALUES(? ,? ,?, ? ,?,?,?,?)";
 

        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, user.getEmailAddress());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setInt(5,1);
            preparedStatement.setString(6, user.getCountryCode() );
            preparedStatement.setString(7, user.getStateCode() );
            preparedStatement.setString(8, user.getDistCode() );

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();
            
            if(res==1)
            {
                result=true;
            }

        } catch (SQLException ex) {
           Logger log = Logger.getLogger(LoginService.class.getName());
           log.error(LocalDateTime.now() + " " + ex.getMessage());
        }
        
        return result; 
    }
    
    public ArrayList getAllCountries() {
        
        ArrayList countryList = new ArrayList();
        String sql = "select * from countries";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                Country country = new Country();
                
                country.setCountryCode(rs.getString("countryCode"));
                country.setCountryName(rs.getString("countryName"));
                
                countryList.add(country);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of countries = " + countryList.size());
        return countryList;
    }
    
    public ArrayList getAllStates(String countryCode) {
        
        ArrayList stateList = new ArrayList();
        String sql = "select * from states where countryCode=?";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,countryCode);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                Province province = new Province();
                
                province.setStateCode(rs.getString("stateCode"));
                province.setStateName(rs.getString("stateName"));
                province.setCountryCode(rs.getString("countryCode"));
                
                stateList.add(province);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of states = " + stateList.size());
        return stateList;
    }
    
    public ArrayList getAllDistricts(String stateCode) {
        
        ArrayList districtList = new ArrayList();
        String sql = "select * from districts where stateCode=?";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,stateCode);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                District district = new District();
                
                district.setDistCode(rs.getString("districtCode"));
                district.setDistName(rs.getString("districtName"));
                district.setStateCode(rs.getString("stateCode"));
                
                districtList.add(district);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of districts = " + districtList.size());
        return districtList;
    }
}
