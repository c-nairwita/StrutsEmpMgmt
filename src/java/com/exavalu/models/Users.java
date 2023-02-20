/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.EmployeeService;
import com.exavalu.services.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Avijit Chattopadhyay
 */
public class Users extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String employeeId;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String password;
    private String countryCode;
    private String stateCode;
    private String distCode;
    private int status;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String doLogin() throws Exception {
        String result = "FAILURE";

        boolean success = LoginService.getInstance().doLogin(this);

        if (success) {
            System.out.println("Returning Success from doLogin method");

            sessionMap.put("Loggedin", this);
            ArrayList empList = EmployeeService.getInstance().getAllEmployees();
            sessionMap.put("EmpList", empList);
            result = "SUCCESS";
        } else {
            System.out.println("Returning Failure from doLogin method");
            
            Logger log = Logger.getLogger(Users.class.getName());
            log.error(LocalDateTime.now() + " Wrong username or password");
            
        }

        return result;
    }

    public String doPreSignUp() throws Exception {
        String result = "SUCCESS";
        ArrayList countryList = LoginService.getInstance().getAllCountries();

        sessionMap.put("CountryList", countryList);
        //sessionMap.put("Users", this);
        System.err.println("Country code = " + this.countryCode);
        
        if (this.countryCode != null) {
            System.err.println("When country is selected, country code: " + this.countryCode);
            ArrayList stateList = LoginService.getInstance().getAllStates(this.countryCode);
            sessionMap.put("StateList", stateList);
            sessionMap.put("Users", this);
            result = "STATELIST";
        }
        if (this.stateCode != null) {
            ArrayList districtList = LoginService.getInstance().getAllDistricts(this.stateCode);
            sessionMap.put("DistrictList", districtList);
            sessionMap.put("Users", this);
            result = "DISTRICTLIST";
        }

        return result;
    }

    public String doSignUp() throws Exception {
        String result = "FAILURE";

        boolean success = LoginService.getInstance().doSignUp(this);

        if (success) {
            result = "SUCCESS";
            sessionMap.put("SuccessSignUp", "Successfully Registered");

        } else {
            sessionMap.put("FailSignUp", "Please Try Again");
            
        }
        System.out.println(sessionMap);
        return result;

    }

    public String doLogout() {
        String result = "SUCCESS";
        sessionMap.clear();
        return result;
    }

    /**
     * @return the employeeId
     */
    public String getEmployeeId() {
        return employeeId;
    }

    /**
     * @param employeeId the employeeId to set
     */
    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the countryCode
     */
    public String getCountryCode() {
        return countryCode;
    }

    /**
     * @param countryCode the countryCode to set
     */
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    /**
     * @return the stateCode
     */
    public String getStateCode() {
        return stateCode;
    }

    /**
     * @param stateCode the stateCode to set
     */
    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    /**
     * @return the distCode
     */
    public String getDistCode() {
        return distCode;
    }

    /**
     * @param distCode the distCode to set
     */
    public void setDistCode(String distCode) {
        this.distCode = distCode;
    }

}
