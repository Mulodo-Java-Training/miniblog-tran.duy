package duy.miniblog.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "users")
public class User
{

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name = "username")
    // Size(min = 6, max = 32)
    private String userName;

    @Column(name = "password")
    // @Size(min = 6, max = 32)
    private String passWord;

    @Column(name = "firstname")
    // @Size(min = 2, max = 16)
    private String firstName;

    @Column(name = "lastname")
    // @Size(min = 2, max = 16)
    private String lastName;

    private String avatar = "user.png";

    private Integer gender;

    @Column(name = "birthdate")
    private String birthDate;

    private String email;

    private Integer boss = 0;

    // @OneToMany(targetEntity=Post.class,mappedBy="user",fetch=FetchType.LAZY,cascade=CascadeType.ALL)

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonIgnore
    Set<Post> posts;

    // @OneToMany(targetEntity=Comment.class,mappedBy="user",fetch=FetchType.LAZY,cascade=CascadeType.ALL)

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonIgnore
    Set<Comment> comments;

    // @OneToMany(targetEntity=Token.class,mappedBy="user",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    Set<Token> tokens;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getPassWord()
    {
        return passWord;
    }

    public void setPassWord(String passWord)
    {
        this.passWord = passWord;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public Integer getGender()
    {
        return gender;
    }

    public void setGender(Integer gender)
    {
        this.gender = gender;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getBirthDate()
    {
        return birthDate;
    }

    public void setBirthDate(String birthDate)
    {
        this.birthDate = birthDate;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Integer getBoss()
    {
        return boss;
    }

    public void setBoss(Integer boss)
    {
        this.boss = boss;
    }

    public Set<Post> getPosts()
    {
        return posts;
    }

    public void setPosts(Set<Post> posts)
    {
        this.posts = posts;
    }

    public Set<Comment> getComments()
    {
        return comments;
    }

    public void setComments(Set<Comment> comments)
    {
        this.comments = comments;
    }

    public Set<Token> getTokens()
    {
        return tokens;
    }

    public void setTokens(Set<Token> tokens)
    {
        this.tokens = tokens;
    }

    @Override
    public String toString()
    {
        return "{\"username\":\"" + userName + "\", \"firstname\":\"" + firstName
                + "\", \"lastname\":\"" + lastName + "\", \"avatar\":\"" + avatar
                + "\", \"gender\":\"" + gender + "\", \"birthdate\":\"" + birthDate
                + "\", \"email\":\"" + email + "\"}";

    }
}
