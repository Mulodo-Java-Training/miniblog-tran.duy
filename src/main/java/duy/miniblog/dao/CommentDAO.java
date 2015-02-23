package duy.miniblog.dao;

import java.util.List;

import duy.miniblog.entity.Comment;

public interface CommentDAO 
{
    
    public void createComment(Comment comment);
    public void updateComment(Comment comment);
    public void deleteComment(Comment comment);
    
    public Comment getCommentById(int commentId);
    public List<Comment> getCommentByPostId(int postId);
    public List<Comment> getCommentByUserId(int userId);

}
