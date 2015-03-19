package duy.miniblog.dao;

import java.util.List;

import duy.miniblog.entity.Post;

public interface PostDAO
{

    public void createPost(Post post);

    public void updatePost(Post post);

    public void deletePost(Post post);

    public List<Post> getAllPosts();

    public List<Post> getAllPostsByUserId(int id);

    public Post getPostById(int id);

}
