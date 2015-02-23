package duy.miniblog.dao.impl;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import duy.miniblog.dao.TokenDAO;
import duy.miniblog.entity.Token;


@Repository
public class TokenDAOImpl implements TokenDAO{
    
    @Autowired
    private HibernateTemplate template;    
  
    
    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }
   
    @Override
    @Transactional(readOnly = false)
    public void createToken(Token token) {
        this.template.save(token);        
    }
        
    @Override
    @Transactional(readOnly = false)
    public void deleteToken(Token token) {
        template.delete(token);
    }
    
    @Override
    @Transactional(readOnly = false)
    public void deleteTokenByUserId(int id){
        template.bulkUpdate("delete from Token where users_id="+id);
    }
    
    @Override
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
    public Token getToken(String accessToken) {
        String query = "from Token where access_token = ?";       
        List<Token> lt = template.find(query, accessToken);
        if (lt.size()!=0) 
            {return lt.get(0);}
        else 
            {return null;}
    }
    
    @Override
    @Transactional(readOnly = false)
    public Boolean checkToken(String accessToken) {
        String query = "from Token where access_token = ?";
        @SuppressWarnings("unchecked")
        List<Token> lst = template.find(query, accessToken);
        if (lst.size() != 0) {
            return true;
        } else {
            return false;
        }
    }   
}
