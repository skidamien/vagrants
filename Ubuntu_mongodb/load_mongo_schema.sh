#!/bin/bash

mongo <<EOF
print("command: show dbs;");
show dbs;

print("command: use damien_db");
use damien_db;

print('command: db.createCollection("damien_db_some_collection");');
db.createCollection("damien_db_some_collection");

print('command: db.damien_db_some_collection.insert({"firstName":"Damien", "lastName":"Michalosky"});');
print('command: db.damien_db_some_collection.insert({"firstName":"Donald", "lastName":"Duck"});');
print('command: db.damien_db_some_collection.insert({"firstName":"Sheldon", "lastName":"Cooper", "Occupation":"Physicist"});');
print('command: db.damien_db_some_collection.insert({"firstName":"Albert", "lastName":"Einstein", "Occupation":"Physicist"});');

db.damien_db_some_collection.insert({"firstName":"Damien", "lastName":"Michalosky"});
db.damien_db_some_collection.insert({"firstName":"Donald", "lastName":"Duck"});
db.damien_db_some_collection.insert({"firstName":"Sheldon", "lastName":"Cooper", "Occupation":"Physicist"});
db.damien_db_some_collection.insert({"firstName":"Albert", "lastName":"Einstein", "Occupation":"Physicist"});

print('command: db.damien_db_some_collection.find();');
db.damien_db_some_collection.find();

print('command: db.damien_db_some_collection.find({"lastName":"Cooper"});');
db.damien_db_some_collection.find({"lastName":"Cooper"})

print('command: db.damien_db_some_collection.find({"Occupation":"Physicist"});');
db.damien_db_some_collection.find({"Occupation":"Physicist"});

print('command: db.damien_db_some_collection.find({"Occupation":"Physicist"}).count();');
db.damien_db_some_collection.find({"Occupation":"Physicist"}).count();

print('command: db.damien_db_some_collection.count();');  
db.damien_db_some_collection.count();

print('command: show collections;');
show collections;

print('command: show dbs;');
show dbs;

exit;
EOF
