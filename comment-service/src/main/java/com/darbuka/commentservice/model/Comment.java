package com.darbuka.commentservice.model;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    private UUID authorId;
    private String content;
    private LocalDateTime postedAt;
    private UUID parentId;
    private int likesCount;
    private String status;

    @ElementCollection
    private List<String> tags;
}
