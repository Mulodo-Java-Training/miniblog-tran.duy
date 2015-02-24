package duy.miniblog.service;

import duy.miniblog.entity.Token;

public interface TokenService
{
    public void createToken(Token token);
    public void deleteToken(Token token);
    public void deleteTokenByUserId(int id);
    public Token getToken(String accessToken);
    public Boolean checkToken(String accessToken); 
}
