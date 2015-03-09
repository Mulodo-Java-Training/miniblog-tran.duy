package duy.miniblog.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test
{
    
    public static String encoderString(String s)
    {
        BCryptPasswordEncoder enc = new BCryptPasswordEncoder();
        return enc.encode(s);
    }
   
    public static void main(String[] args)
    {
        System.out.println(encoderString("111"));
       
    }
}
