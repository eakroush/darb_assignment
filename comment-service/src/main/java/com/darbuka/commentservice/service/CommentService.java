package com.darbuka.commentservice.service;

import com.darbuka.commentservice.model.Comment;
import com.darbuka.commentservice.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> getAllComments() {
        return  commentRepository.findAll();
    }
    public Optional<Comment> getCommentById(UUID id){
        return commentRepository.findById(id);
    }

    public Comment addComment(Comment comment) {
        //comment.pos
        return commentRepository.save(comment);
    }

    public Comment updateComment(UUID id, Comment updatedComment) {
        if (commentRepository.existsById(id)) {
            //updatedComment.setId(id);
            return commentRepository.save(updatedComment);
        }
        return null;
    }

    public void deleteComment(UUID id) {
        commentRepository.deleteById(id);
    }

}
