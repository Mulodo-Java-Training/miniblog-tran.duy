package duy.miniblog.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import duy.miniblog.dao.PostDAO;
import duy.miniblog.entity.Post;

@Repository
public class PostDAOImpl implements PostDAO
{

    @Autowired
    private HibernateTemplate template;

    public void setTemplate(HibernateTemplate template)
    {
        this.template = template;
    }

    @Override
    @Transactional(readOnly = false)
    public void createPost(Post post)
    {
        template.save(post);
    }

    @Override
    @Transactional(readOnly = false)
    public void updatePost(Post post)
    {
        template.update(post);
    }

    @Override
    @Transactional(readOnly = false)
    public void deletePost(Post post)
    {
        template.delete(post);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = false)
    public List<Post> getAllPosts()
    {

        List<Post> lst = template
                .find("from Post where updated_at <= NOW() ORDER BY updated_at DESC");
        return lst.subList(0, 10);
    }

    @Override
    @Transactional(readOnly = false)
    public List<Post> getAllPostsByUserId(int id)
    {
        @SuppressWarnings("unchecked")
        List<Post> lst = template
                .find("from Post where users_id = ? AND updated_at <= NOW() ORDER BY updated_at DESC",
                        id);
        return lst;
    }

    @Override
    @Transactional(readOnly = false)
    public Post getPostById(int id)
    {
        @SuppressWarnings("unchecked")
        List<Post> lst = template.find("from Post where id = ?", id);
        if (lst.size() == 1) {
            return lst.get(0);
        } else {
            return null;
        }
    }

}
