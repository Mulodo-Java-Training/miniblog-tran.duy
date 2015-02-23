package duy.miniblog.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import duy.miniblog.dao.CommentDAO;
import duy.miniblog.entity.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO 
{
    @Autowired
    private HibernateTemplate template;    
    
    public void setTemplate(HibernateTemplate template)
    {
        this.template = template;
    }

    @Override
    @Transactional(readOnly = false)
    public void createComment(Comment comment)
    {
        template.save(comment);
    }
    
    @Override
    @Transactional(readOnly = false)
    public void updateComment(Comment comment)
    {
        template.update(comment);
    }
    
    @Override
    @Transactional(readOnly = false)
    public void deleteComment(Comment comment)
    {
        template.delete(comment);
    }
    
    @Override
    @Transactional(readOnly = false)
    public Comment getCommentById(int commentId)
    {
        @SuppressWarnings("unchecked")
        List<Comment> lst = template.find("from Comment where id = ?", commentId);
        if (lst.size() == 1){
            return lst.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional(readOnly = false)
    public List<Comment> getCommentByPostId(int postId)
    {
        @SuppressWarnings("unchecked")
        List<Comment> lst = template.find("from Comment where posts_id = ?", postId);
        if (lst.size() > 0){
            return lst;
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional(readOnly = false)
    public List<Comment> getCommentByUserId(int userId)
    {
        @SuppressWarnings("unchecked")
        List<Comment> lst = template.find("from Comment where users_id = ?", userId);
        if (lst.size() > 0){
            return lst;
        } else {
            return null;
        }
    }
}
