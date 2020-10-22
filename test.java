/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.text;

import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author estudiante102
 */
@ManagedBean
@RequestScoped
public class test {

    private String password;
    private String user;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String validar() {
        if (user.equals("admin") && password.equals("admin")) {
            return "logiado";
        } else {
            return "error";
        }
    }

    /**
     * Creates a new instance of test
     */
    public test() {
    }

}
