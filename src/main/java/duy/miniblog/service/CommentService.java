package duy.miniblog.service;

import java.util.List;

import duy.miniblog.entity.Comment;

public interface CommentService
{
    public void createComment(Comment comment);
    public void updateComment(Comment comment);
    public void deleteComment(Comment comment);
    public void deleteAllCommentsByPostId(int postId);
    
    public Comment getCommentById(int commentId);
    public List<Comment> getCommentByPostId(int postId);
    public List<Comment> getCommentByUserId(int userId);
}
