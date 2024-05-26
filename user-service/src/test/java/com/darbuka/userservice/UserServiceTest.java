package com.darbuka.userservice;

import com.darbuka.userservice.model.User;
import com.darbuka.userservice.repository.UserRepository;
import com.darbuka.userservice.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

public class UserServiceTest {

    @InjectMocks
    UserService userService;

    @Mock
    UserRepository userRepository;

    @BeforeEach
    public void init() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void getUserByIdTest() {
        UUID id = UUID.randomUUID();
        User user = new User();
        user.setId(id);
        when(userRepository.findById(id)).thenReturn(Optional.of(user));

        Optional<User> userById = userService.getUserById(id);
        assertEquals(userById.get().getId(), id);
    }

    @Test
    public void createUserTest() {
        User user = new User();
        user.setUsername("John Doe");
        when(userRepository.save(user)).thenReturn(user);

        User createdUser = userService.addUser(user);
        assertEquals(createdUser.getUsername(), "John Doe");
    }

}
