package duy.miniblog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import duy.miniblog.dao.TokenDAO;
import duy.miniblog.entity.Token;
import duy.miniblog.service.TokenService;

@Service
public class TokenServiceImpl implements TokenService
{
    
    @Autowired
    private TokenDAO tokenDao;
    
    @Override
    public void createToken(Token token)
    {
        tokenDao.createToken(token);
    }
    
    @Override
    public void deleteToken(Token token)
    {
        tokenDao.deleteToken(token);
    }
    
    @Override
    public void deleteTokenByUserId(int id)
    {
        tokenDao.deleteTokenByUserId(id);
    }
    
    @Override
    public Token getToken(String accessToken)
    {
        return tokenDao.getToken(accessToken);
    }
    
    @Override
    public Boolean checkToken(String accessToken)
    {
        return tokenDao.checkToken(accessToken);
    }
}
