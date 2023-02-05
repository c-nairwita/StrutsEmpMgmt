/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Employee;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Nairwita Chakraborty
 */
public class EmployeeService {

    public static EmployeeService employeeService = null;

    public static EmployeeService getInstance() {
        if (employeeService == null) {
            return new EmployeeService();
        } else {
            return employeeService;
        }
    }

    public ArrayList getAllEmployees() {
        
        ArrayList empList = new ArrayList();
        String sql = "select * from employees e, departments d, roles r "
                + "where e.departmentId=d.departmentId and e.roleId=r.roleId order by employeeId desc";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                Employee emp = new Employee();
                
                emp.setEmployeeId(rs.getInt("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setGender(rs.getString("gender"));
                emp.setAddress(rs.getString("address"));
                emp.setPhnumber(rs.getString("phnumber"));
                emp.setAge(rs.getInt("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getDouble("basicSalary"));
                emp.setCarAllowance(rs.getDouble("carAllowance"));
                emp.setSpecialAllowance(rs.getDouble("specialAllowance"));
                emp.setDepartmentId(rs.getInt("departmentId"));
                emp.setRoleId(rs.getInt("roleId"));

                empList.add(emp);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = " + empList.size());
        return empList;
    }
    
    public Employee getEmployee(int employeeId) {

        Employee emp = new Employee();
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId and  e.employeeId =?";
            
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, employeeId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                
                emp.setEmployeeId(employeeId);
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setGender(rs.getString("gender"));
                emp.setAddress(rs.getString("address"));
                emp.setPhnumber(rs.getString("phnumber"));
                emp.setAge(rs.getInt("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getDouble("basicSalary"));
                emp.setCarAllowance(rs.getDouble("carAllowance"));
                emp.setSpecialAllowance(rs.getDouble("specialAllowance"));
                emp.setDepartmentId(rs.getInt("departmentId"));
                emp.setRoleId(rs.getInt("roleId"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return emp;

    }
    
    public static boolean updateEmployee(Employee emp, int employeeId) {
        
        String sql = "UPDATE employees\n"
                    + "SET firstName = ? , lastName = ? , gender = ? , address = ? ,\n"
                    + "phnumber = ? , age = ? , basicSalary = ?,carAllowance = ?, specialAllowance = ?, departmentId = ?, roleId = ?\n"
                    + "WHERE employeeId = ?";
        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();           

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getGender());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getPhnumber());
            preparedStatement.setInt(6, emp.getAge());
            preparedStatement.setDouble(7, emp.getBasicSalary());
            preparedStatement.setDouble(8, emp.getCarAllowance());
            preparedStatement.setDouble(9, emp.getSpecialAllowance());
            preparedStatement.setInt(10, emp.getDepartmentId());
            preparedStatement.setInt(11, emp.getRoleId());          
            preparedStatement.setInt(12, employeeId);
            
            int row = preparedStatement.executeUpdate();

            if(row==1)
            {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    public ArrayList searchEmployee(String firstName, String lastName, String gender, String departmentName, String roleName) {
        ArrayList empList = new ArrayList();
        String sql = "SELECT * from employees e join departments d join roles r where e.departmentId = d.departmentId and e.roleId = r.roleId and e.firstName like ? and e.lastName like ? and e.gender like ? and d.departmentName like ? and r.roleName like ?";
        
        try {

            Connection con = JDBCConnectionManager.getConnection(); 
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, firstName + "%");
            preparedStatement.setString(2, lastName + "%");
            preparedStatement.setString(3, gender + "%");
            preparedStatement.setString(4, departmentName + "%");
            preparedStatement.setString(5, roleName + "%");
            
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
            Employee emp = new Employee();
            
            emp.setEmployeeId(rs.getInt("employeeId"));
            emp.setFirstName(rs.getString("firstName"));
            emp.setLastName(rs.getString("lastName"));
            emp.setGender(rs.getString("gender"));
            emp.setAddress(rs.getString("address"));
            emp.setPhnumber(rs.getString("phnumber"));
            emp.setAge(rs.getInt("age"));
            emp.setDepartmentName(rs.getString("departmentName"));
            emp.setRoleName(rs.getString("roleName"));
            emp.setBasicSalary(rs.getDouble("basicSalary"));
            emp.setCarAllowance(rs.getDouble("carAllowance"));
            emp.setSpecialAllowance(rs.getDouble("specialAllowance"));

            empList.add(emp);

        }
        
    }   catch (SQLException ex) {
            ex.printStackTrace();
        }
        return empList;
    }
    
    public static boolean addEmployee(Employee emp) {
        
        String sql = "INSERT INTO employees (firstName, lastName, gender, address, phnumber, age, departmentId, roleId, basicSalary, carAllowance, specialAllowance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
         
            
            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getGender());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getPhnumber());
            preparedStatement.setInt(6, emp.getAge());
            preparedStatement.setInt(7, emp.getDepartmentId());
            preparedStatement.setInt(8, emp.getRoleId());
            preparedStatement.setDouble(9, emp.getBasicSalary());
            preparedStatement.setDouble(10, emp.getCarAllowance());
            preparedStatement.setDouble(11, emp.getSpecialAllowance());
            
            int row = preparedStatement.executeUpdate();

            if(row==1)
            {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public boolean deleteEmployee(int employeeId) {
        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Delete From employees WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setInt(1, employeeId);
            System.out.println(preparedStatement);
            int row = preparedStatement.executeUpdate();
            if (row != 0) {
                result = true;
            }

        } catch (SQLException ex) {

        }
        return result;

    }
}
