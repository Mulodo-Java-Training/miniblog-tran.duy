package duy.miniblog.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptionUtil
{

    public static String encryptString(String str) throws Exception
    {
        return encryptString(str, "SHA-256");
    }

    private static String encryptString(String str, String algorithm) throws Exception
    {
        try {
            MessageDigest digest = MessageDigest.getInstance(algorithm);
            byte[] hashedString = digest.digest(str.getBytes("UTF-8"));

            // convert byte array to string
            StringBuffer strBuf = new StringBuffer();
            for (int i = 0; i < hashedString.length; i++) {
                strBuf.append(Integer.toString((hashedString[i] & 0xff) + 0x100, 16).substring(1));
            }
            return strBuf.toString();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            throw new Exception("Can not generate hash", ex);
        }
    }
}
