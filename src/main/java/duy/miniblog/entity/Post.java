package duy.miniblog.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.ForeignKey;

@Entity
@Table(name = "posts")
public class Post
{

    @Id
    @GeneratedValue
    private int id;
    private String title;
    private String description;
    private String created_at;
    private String updated_at;
    private Integer deactived = 0;

    @ManyToOne
    @JoinColumn(name = "users_id")
    @ForeignKey(name = "fk_posts_users1")
    @JsonIgnore
    private User user;

    @OneToMany(mappedBy = "post")
    @JsonIgnore
    private List<Comment> comments;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getCreated_at()
    {
        return created_at;
    }

    public void setCreated_at(String created_at)
    {
        this.created_at = created_at;
    }

    public String getUpdated_at()
    {
        return updated_at;
    }

    public void setUpdated_at(String updated_at)
    {
        this.updated_at = updated_at;
    }

    public Integer getDeactived()
    {
        return deactived;
    }

    public void setDeactived(Integer deactived)
    {
        this.deactived = deactived;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public List<Comment> getComments()
    {
        return comments;
    }

    public void setComments(List<Comment> comments)
    {
        this.comments = comments;
    }
    
    @Override
    public String toString()
    {
        return "{\"id\":\"" + id + "\", \"title\":\"" + title
                + "\", \"description\":\"" + description + "\", \"created_at\":\"" + created_at
                + "\", \"updated_at\":\"" + updated_at + "\", \"deactived\":\"" + deactived
                + "\", \"firstName\":\"" + user.getFirstName() + "\", \"lastName\":\"" + user.getLastName()
                + "\", \"user_id\":\"" + user.getId() + "\"}";

    }
    
}
