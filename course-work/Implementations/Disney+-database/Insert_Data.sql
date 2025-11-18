INSERT INTO Users (user_id, full_name, email, country, birth_date, registration_date) VALUES
(1, 'John Smith', 'john.smith@example.com', 'USA', '1985-04-12', '2023-01-01'),
(2, 'Emily Johnson', 'emily.j@example.com', 'Canada', '1990-09-20', '2023-02-15'),
(3, 'Daniel Lee', 'daniel.lee@example.com', 'UK', '1995-07-08', '2023-03-10');

INSERT INTO Profiles (profile_id, user_id, profile_name, is_kids_profile, preferred_language) VALUES
(101, 1, 'John', FALSE, 'English'),
(102, 1, 'Emma', TRUE, 'English'),
(201, 2, 'Emily', FALSE, 'French'),
(301, 3, 'Daniel', FALSE, 'English'),
(302, 3, 'Sophie', TRUE, 'Spanish');

INSERT INTO Subscriptions (subscription_id, user_id, plan_name, price_monthly, start_date, end_date) VALUES
(1001, 1, 'Premium', 12.99, '2023-01-01', NULL),
(1002, 2, 'Standard', 8.99, '2023-02-15', NULL),
(1003, 3, 'Premium', 12.99, '2023-03-10', NULL);

INSERT INTO PaymentMethods (payment_method_id, subscription_id, method_type, last4digits, expiration_date) VALUES
(5001, 1001, 'Card', '1123', '2026-10-01'),
(5002, 1002, 'PayPal', '0000', '2028-05-01'),
(5003, 1003, 'Card', '9921', '2027-12-01');

INSERT INTO Titles (title_id, title_name, title_type, release_year, age_rating, description) VALUES
(10001, 'The Mandalorian', 'Series', 2019, 'PG-13', 'A bounty hunter travels the galaxy.'),
(10002, 'Moana', 'Movie', 2016, 'PG', 'A young girl sets sail to save her island.'),
(10003, 'Avatar', 'Movie', 2009, 'PG-13', 'A marine on an alien planet.'),
(10004, 'Frozen', 'Movie', 2013, 'PG', 'Two sisters and magical adventures.');

INSERT INTO Genres (genre_id, genre_name, description) VALUES
(1, 'Action', 'Fast-paced content with fights and battles'),
(2, 'Adventure', 'Exploration and quests'),
(3, 'Animation', 'Animated films and series'),
(4, 'Family', 'Family-friendly entertainment');

INSERT INTO TitleGenres (title_genre_id, title_id, genre_id) VALUES
(9001, 10001, 1), -- Mandalorian - Action
(9002, 10001, 2), -- Mandalorian - Adventure
(9003, 10002, 3), -- Moana - Animation
(9004, 10002, 2), -- Moana - Adventure
(9005, 10003, 1), -- Avatar - Action
(9006, 10003, 2), -- Avatar - Adventure
(9007, 10004, 3), -- Frozen - Animation
(9008, 10004, 4); -- Frozen - Family

INSERT INTO WatchHistory (watch_id, profile_id, title_id, watch_datetime, duration_minutes) VALUES
(7001, 101, 10001, '2023-05-10 18:30:00', 45),
(7002, 102, 10002, '2023-05-11 14:00:00', 90),
(7003, 201, 10003, '2023-05-12 20:15:00', 120),
(7004, 301, 10001, '2023-05-13 21:30:00', 40),
(7005, 302, 10004, '2023-05-14 16:45:00', 102);
