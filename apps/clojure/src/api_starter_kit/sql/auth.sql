-- :name find-user-by-username :? :1
SELECT id FROM users
WHERE username = :username
LIMIT 1
