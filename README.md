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
As a user
So that I can revisit internet pages that I like
I want to see a list of my bookmarks
```
![first story domain model](https://github.com/JR-G/bookmark-manager/blob/master/img/first_story_model.png)
```
As a user
So that I can save pages that I like
I want to add a bookmark to the bookmark manager
```
```
As a user
So that I can remove a bookmark
I want to delete a bookmark from the bookmark manager
```