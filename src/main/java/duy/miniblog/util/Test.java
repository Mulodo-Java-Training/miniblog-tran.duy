package duy.miniblog.util;

import java.util.regex.Pattern;

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
        String rexgen = "(19|20)[0-9]{2}-((0[1-9])|(1[012]))-((0[1-9])|([1-2][0-9])|(3[0-1]))";
        System.out.println(Pattern.matches(rexgen, "1978-09-31"));
    }
}
