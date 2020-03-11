/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customtag;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author hi
 */
public class EmtTag extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    String department;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/employeedb","root","root");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT tblemployee.*,tbldepartment.DepartmentName from tblemployee,tbldepartment WHERE tblemployee.DeptId=tbldepartment.DeptId AND tbldepartment.DepartmentName='"+getDepartment()+"'");
            
            while (rs.next()) {                
                out.println(rs.getString(2)+",  ");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
    
}
