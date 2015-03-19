package duy.miniblog.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.ForeignKey;

@Entity
@Table(name = "tokens")
public class Token
{

    @ManyToOne
    @JoinColumn(name = "users_id")
    @ForeignKey(name = "fk_tokens_users1")
    @JsonIgnore
    User user;

    @Id
    private String access_token;

    private String create_at;

    private String expired;

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public String getAccess_token()
    {
        return access_token;
    }

    public void setAccess_token(String access_token)
    {
        this.access_token = access_token;
    }

    public String getCreate_at()
    {
        return create_at;
    }

    public void setCreate_at(String create_at)
    {

        this.create_at = create_at;
    }

    public String getExpired()
    {
        return expired;
    }

    public void setExpired(String expired)
    {
        this.expired = expired;
    }

}
