You can view details for a student by visiting _yourhost_/students?id=1. Currently there is data only for two students with id 1 and 2 in the db.

NOTES

- Duе to time constraints i did not implement prevention for sql injection in StudentDataLoader.
- I did not find a good way to split the changes in multiple commits, since they are all connected.

SETUP DB
- The app uses MySQL for persistence and in order to get it working you need to import provided sql file(grades-manager.sql)
