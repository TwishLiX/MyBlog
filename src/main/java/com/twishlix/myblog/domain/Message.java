package com.twishlix.myblog.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@NoArgsConstructor
public class Message {
    @Id
    @SequenceGenerator(name = "msg_generator", allocationSize = 1)
    @GeneratedValue(generator = "msg_generator")
    @Getter
    @Setter
    private Long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message is too long")
    @Getter
    @Setter
    private String text;

    @Length(max = 255, message = "Message is too long")
    @Getter
    @Setter
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    @Getter
    @Setter
    private User author;

    @Getter
    @Setter
    private String filename;

    public Message(String text, String tag, User user) {
        this.text = text;
        this.tag = tag;
        this.author = user;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }
}
