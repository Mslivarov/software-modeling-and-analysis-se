CREATE TABLE Users (
    user_id            INT PRIMARY KEY,
    full_name          VARCHAR(100) NOT NULL,
    email              VARCHAR(150) NOT NULL UNIQUE,
    country            VARCHAR(80),
    birth_date         DATE,
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);
CREATE TABLE Profiles (
    profile_id          INT PRIMARY KEY,
    user_id             INT NOT NULL,
    profile_name        VARCHAR(100) NOT NULL,
    is_kids_profile     BOOLEAN NOT NULL DEFAULT FALSE,
    preferred_language  VARCHAR(50),

    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Subscriptions (
    subscription_id   INT PRIMARY KEY,
    user_id           INT NOT NULL,
    plan_name         VARCHAR(100) NOT NULL,
    price_monthly     DECIMAL(10,2) NOT NULL,
    start_date        DATE NOT NULL,
    end_date          DATE,

    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE PaymentMethods (
    payment_method_id  INT PRIMARY KEY,
    subscription_id    INT NOT NULL,
    method_type        VARCHAR(50) NOT NULL,
    last4digits        CHAR(4) NOT NULL,
    expiration_date    DATE NOT NULL,

    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);
CREATE TABLE Titles (
    title_id      INT PRIMARY KEY,
    title_name    VARCHAR(200) NOT NULL,
    title_type    VARCHAR(20) NOT NULL,   -- Movie / Series
    release_year  INT,
    age_rating    VARCHAR(20),
    description   TEXT
);
CREATE TABLE Genres (
    genre_id      INT PRIMARY KEY,
    genre_name    VARCHAR(100) NOT NULL,
    description   VARCHAR(255)
);
CREATE TABLE TitleGenres (
    title_genre_id INT PRIMARY KEY,
    title_id       INT NOT NULL,
    genre_id       INT NOT NULL,

    FOREIGN KEY (title_id) REFERENCES Titles(title_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
CREATE TABLE WatchHistory (
    watch_id         INT PRIMARY KEY,
    profile_id       INT NOT NULL,
    title_id         INT NOT NULL,
    watch_datetime   TIMESTAMP NOT NULL,
    duration_minutes INT NOT NULL,

    FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id),
    FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);
