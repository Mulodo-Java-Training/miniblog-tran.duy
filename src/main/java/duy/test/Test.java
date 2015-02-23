package duy.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import duy.miniblog.util.EncryptionUtil;



public class Test {
    
    public static void main(String[] args) throws Exception {
        /*
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     
        Calendar cal = Calendar.getInstance();
        
        String create_at = dateFormat.format(cal.getTime());
        
        Date abc = dateFormat.parse(create_at);
        
        cal.add(Calendar.DAY_OF_YEAR, 7);
        String expired = dateFormat.format(cal.getTime());
        System.out.println(create_at);
        System.out.println(expired);
        System.out.println(abc);
        */
        System.out.println(EncryptionUtil.encryptString("444"));
        System.out.println("{\"firstname\":\"John\", \"lastname\":\"Steve\"}");
    }

}
