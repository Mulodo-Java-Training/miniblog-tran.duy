package duy.miniblog.dao;

import java.util.List;

import duy.miniblog.entity.Token;

public interface TokenDAO {

    public void createToken(Token token);
    public void deleteToken(Token token);
    public void deleteTokenByUserId(int id);
    public Token getToken(String accessToken);
    public Boolean checkToken(String accessToken);    
  
}
