INSERT INTO categories (name, description)
SELECT v.name, v.description
FROM (VALUES
    ('Algoritma & Pemrograman', 'Pembelajaran dasar algoritma dan pemrograman'),
    ('Pengembangan Website', 'Pembelajaran web development'),
    ('Desain UI/UX', 'Pembelajaran desain antarmuka dan user experience'),
    ('Kecerdasan Buatan', 'Pembelajaran AI dan machine learning'),
    ('Pemrograman Mobile', 'Pembelajaran mobile app development'),
    ('Game Development', 'Pembelajaran game development'),
    ('Data Science', 'Pembelajaran data science dan analytics')
) AS v(name, description)
WHERE NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.name = v.name
);
