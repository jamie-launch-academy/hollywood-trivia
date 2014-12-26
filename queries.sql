-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

-- YOUR QUERY HERE

SELECT title, rating FROM movies
WHERE rating IS NOT NULL
ORDER BY rating LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

-- YOUR QUERY HERE

SELECT title FROM movies
WHERE rating IS NULL
ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

-- YOUR QUERY HERE

SELECT title FROM movies
WHERE synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- YOUR QUERY HERE

SELECT m.title, m.year, m.rating FROM movies m
JOIN genres g ON g.id = m.genre_id
WHERE g.id = 17
AND m.year > 1980
AND m.year < 1990
AND rating IS NOT NULL
ORDER BY m.rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- YOUR QUERY HERE

SELECT a.name, m.title, m.year FROM movies m
JOIN cast_members cm ON cm.movie_id = m.id
JOIN actors a ON a.id = cm.actor_id
WHERE cm.character LIKE 'James Bond'
ORDER BY m.year;


-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- YOUR QUERY HERE

SELECT m.title, m.year, g.name FROM movies m
JOIN genres g ON g.id = m.genre_id
JOIN cast_members cm ON cm.movie_id = m.id
JOIN actors a ON a.id = cm.actor_id
WHERE a.name LIKE 'Julianne Moore'
ORDER BY g.name, m.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

-- YOUR QUERY HERE

SELECT m.title, m.year, s.name FROM movies m
JOIN studios s on s.id = m.studio_id
JOIN genres g on g.id = m.genre_id
WHERE g.id = 2
ORDER BY m.year LIMIT 5;
