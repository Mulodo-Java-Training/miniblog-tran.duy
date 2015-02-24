package duy.miniblog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import duy.miniblog.dao.PostDAO;
import duy.miniblog.entity.Post;
import duy.miniblog.service.PostService;

@Service
public class PostServiceImpl implements PostService
{
    @Autowired
    private PostDAO postDao;
    
    @Override
    public void createPost(Post post)
    {
        postDao.createPost(post);
    }
    
    @Override
    public void updatePost(Post post)
    {
        postDao.updatePost(post);
    }
    
    @Override
    public void deletePost(Post post)
    {
        postDao.deletePost(post);
    }
    
    @Override
    public List<Post> getAllPosts()
    {
        return postDao.getAllPosts();
    }
    
    @Override
    public List<Post> getAllPostsByUserId(int id)
    {
        return postDao.getAllPostsByUserId(id);
    }
    
    @Override
    public Post getPostById(int id)
    {
        return postDao.getPostById(id);
    }
}
