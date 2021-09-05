package com.twishlix.myblog.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @SequenceGenerator(name = "user_generator", allocationSize = 1)
    @GeneratedValue(generator = "user_generator")
    @Getter
    @Setter
    private Long id;

    @NotBlank(message = "Username field cannot be empty")
    @Getter
    @Setter
    private String username;

    @NotBlank(message = "Password field cannot be empty")
    @Getter
    @Setter
    private String password;

    @Getter
    @Setter
    private boolean active;

    @Email(message = "Email is not correct")
    @NotBlank(message = "Email field cannot be empty")
    @Getter
    @Setter
    private String email;

    @Getter
    @Setter
    private String activationCode;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    @Getter
    @Setter
    private Set<Role> roles;

    public boolean isAdmin() {
        return roles.contains(Role.ADMIN);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
