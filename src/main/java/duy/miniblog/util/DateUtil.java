package duy.miniblog.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class DateUtil {
    
    public static String createAt(){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }
    
    public static String expired(){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, 7);
        return dateFormat.format(cal.getTime());
    }
}
