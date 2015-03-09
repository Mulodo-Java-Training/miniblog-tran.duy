package duy.miniblog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import duy.miniblog.dao.CommentDAO;
import duy.miniblog.entity.Comment;
import duy.miniblog.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService
{
    @Autowired
    private CommentDAO cmDao;
    
    @Override
    public void createComment(Comment comment)
    {
        cmDao.createComment(comment);
    }
    
    @Override
    public void updateComment(Comment comment)
    {
        cmDao.updateComment(comment);
    }
    
    @Override
    public void deleteComment(Comment comment)
    {
        cmDao.deleteComment(comment);
    }
    
    @Override
    public Comment getCommentById(int commentId)
    {
        return cmDao.getCommentById(commentId);
    }
    
    @Override
    public List<Comment> getCommentByPostId(int postId)
    {
        return cmDao.getCommentByPostId(postId);
    }
    @Override
    public void deleteAllCommentsByPostId(int postId)
    {
    	cmDao.deleteAllCommentsByPostId(postId);
    }
    
    @Override
    public List<Comment> getCommentByUserId(int userId)
    {
        return cmDao.getCommentByUserId(userId);
    }
}
