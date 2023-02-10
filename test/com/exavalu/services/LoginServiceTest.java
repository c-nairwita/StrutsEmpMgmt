/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Users;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Nairwita Chakraborty
 */
public class LoginServiceTest {
    
    public LoginServiceTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getInstance method, of class LoginService.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        LoginService expResult = null;
        LoginService result = LoginService.getInstance();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of doLogin method, of class LoginService.
     */
    @Test
    public void testDoLogin() {
        System.out.println("doLogin");
        Users user = null;
        LoginService instance = null;
        boolean expResult = false;
        boolean result = instance.doLogin(user);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
