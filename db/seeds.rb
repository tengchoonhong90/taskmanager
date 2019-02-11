# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
    {"email": "aaaaa@aaaaa","password": "123456", "password_confirmation": "123456", "name": "aaaaa", "username": "aaaaa", "phone": 123456780},
    {"email": "bbbbb@bbbbb","password": "123456", "password_confirmation": "123456", "name": "bbbbb", "username": "bbbbb", "phone": 983645241},
    {"email": "ccccc@ccccc","password": "123456", "password_confirmation": "123456", "name": "ccccc", "username": "ccccc", "phone": 746352528},
    {"email": "ddddd@ddddd","password": "123456", "password_confirmation": "123456", "name": "ddddd", "username": "ddddd", "phone": 463528037},
    {"email": "eeeee@eeeee","password": "123456", "password_confirmation": "123456", "name": "eeeee", "username": "eeeee", "phone": 303832627}
])

Task.create!([
    {"user_id": 1, "task_name": "Help to walk my dog", "task_description": "I need someone to walk my dog while i am away at work", "start_time": DateTime.parse("2019-08-11 14:00"), "price": 20, "negotiable": false, "location": "Orchard Road, Singapore", "longitude": 103.8380766, "latitude": 1.301674},
    {"user_id": 1, "task_name": "Looking for someone to look after my pets", "task_description": "I need someone trustworthy to look after my pets while i'm on vacation", "start_time": DateTime.parse("2019-09-21 10:00"), "price": 40, "negotiable": false, "location": "89 East Coast Avenue, Singapore", "longitude": 103.92532400000005, "latitude": 1.3106426},
    {"user_id": 1, "task_name": "Help me with my homework", "task_description": "Need some1 smart to do my homework for me", "start_time": DateTime.parse("2019-03-12 20:00"), "price": 90, "negotiable": true, "location": "5 Paya Lebar Road, Singapore", "longitude": 103.892698, "latitude": 1.316645},
    {"user_id": 1, "task_name": "Professional Photographer wanted", "task_description": "Looking for a professional photographer to take shots for my modeling portfolio", "start_time": DateTime.parse("2019-03-20 16:00"), "price": 39, "negotiable": true, "location": "110A Lorong 1 Toa Payoh, Singapore", "longitude": 103.84614599999998, "latitude": 1.341966},
    {"user_id": 1, "task_name": "Looking for delivery guy", "task_description": "Looking for someone to buy food for my disabled dad", "start_time": DateTime.parse("2019-07-11 12:00"), "price": 10, "negotiable": true, "location": "993B Yio Chu Kang Road, Singapore", "longitude": 103.87776800000006, "latitude": 1.355344},    {"user_id": 5, "task_name": "Help wanted, 9-5", "task_description": "I need someone to stand-in as a waiter for the day", "start_time": DateTime.parse("2019-11-23 08:00"), "price": 45, "negotiable": false, "location": "88 Gerald Drive, Singapore", "longitude": 103.87796730000002, "latitude": 1.3858756},
    {"user_id": 1, "task_name": "Looking for help with building computers", "task_description": "Need an experienced person to help me build my computer for me", "start_time": DateTime.parse("2019-09-30 17:00"), "price": 25, "negotiable": false, "location": "865 Tampines Street 81, Singapore", "longitude": 103.93161970000006, "latitude": 1.34968},
    {"user_id": 2, "task_name": "Need help cooking dinner", "task_description": "I need someone professional to help me cook a romantic dinner for my and my girlfriend for our anniversary", "start_time": DateTime.parse("2019-10-11 16:00"), "price": 18, "negotiable": true, "location": "654A Senja Road, Singapore", "longitude": 103.76417400000003, "latitude": 1.387535},
    {"user_id": 3, "task_name": "Looking for someone to watch a movie together", "task_description": "Feeling lonely, looking for someone to accompany me to the movies", "start_time": DateTime.parse("2019-08-25 20:45"), "price": 6, "negotiable": true, "location": "544 Sixth Avenue, Singapore", "longitude": 103.78882499999997, "latitude": 1.319638},
    {"user_id": 4, "task_name": "Need help carrying stuff", "task_description": "I need someone to help me carry stuff around for the day", "start_time": DateTime.parse("2019-08-02 08:00"), "price": 5, "negotiable": false, "location": "432 Race Course Road, Singapore", "longitude": 103.85789899999997, "latitude": 1.315743},
    {"user_id": 2, "task_name": "Looking for professional Bartender", "task_description": "Reasonable pay given, urgent", "start_time": DateTime.parse("2019-06-02 18:00"), "price": 250, "negotiable": true, "location": "324 Lavender Street, Singapore", "longitude": 103.85916399999996, "latitude": 1.315665}
])

Taskee.create!([
    {"task_id": 1, "user_id": 2},
    {"task_id": 2, "user_id": 1},
    {"task_id": 3, "user_id": 5},
    {"task_id": 4, "user_id": 1},
    {"task_id": 5, "user_id": 4},
    {"task_id": 6, "user_id": 1},
    {"task_id": 7, "user_id": 5},
    {"task_id": 8, "user_id": 2, "bid": 75},
    {"task_id": 8, "user_id": 3, "bid": 85},
    {"task_id": 9, "user_id": 5},
    {"task_id": 10, "user_id": 1},
])

Reputation.create!([
    {"task_id": 1, "user_id": 2, "rep": 2},
    {"task_id": 2, "user_id": 2, "rep": 2},
    {"task_id": 3, "user_id": 2, "rep": 2},
    {"task_id": 4, "user_id": 2, "rep": 2},
    {"task_id": 5, "user_id": 2, "rep": 2},
    {"task_id": 6, "user_id": 2, "rep": 2},
    {"task_id": 7, "user_id": 2, "rep": 3},
    {"task_id": 8, "user_id": 2, "rep": 3},
    {"task_id": 9, "user_id": 2, "rep": 3},
    {"task_id": 10, "user_id": 2, "rep": 3},
])