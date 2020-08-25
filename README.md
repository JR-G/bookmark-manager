# Bookmark Manager

### To set up the database

Connect to `psql` and create the `bookmark_manager` database and `bookmark_manager_test`:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the app

```
rackup -p 3000
```

## User Stories ##

```
As an internet user,
So that I can revisit internet pages that I like
I want to see a list of my bookmarks
```
![first story domain model](https://github.com/JR-G/bookmark-manager/blob/master/img/first_story_model.png)
