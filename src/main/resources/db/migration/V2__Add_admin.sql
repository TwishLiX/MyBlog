INSERT INTO user (id, username, email, password, active)
VALUES (0, 'admin', 'yigahel905@mnqlm.com', '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6', true);

INSERT INTO user_role (user_id, roles)
VALUES (0, 'USER'), (0, 'ADMIN');