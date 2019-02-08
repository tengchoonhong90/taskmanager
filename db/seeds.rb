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
1    {"user_id": 1, "task_name": "Help to walk my dog", "task_description": "I need someone to walk my dog while i am away at work", "start_time": DateTime.parse("2019-08-11 14:00"), "price": 20, "negotiable": false, "location": "Orchard Road, Singapore", "longitude": 103.8380766, "latitude": 1.301674},
2    {"user_id": 2, "task_name": "Need groceries to be bought", "task_description": "I don't have time to stock up on groceries, i need someone to buy them for me", "start_time": DateTime.parse("2019-11-28 16:00"), "price": 80, "negotiable": false, "location": "655 Balestier Road, Singapore", "longitude": 103.84247290000008, "latitude": 1.3264029},
3    {"user_id": 4, "task_name": "Help Required!", "task_description": "I need someone to take my parents to the hospital as i am occupied with work", "start_time": DateTime.parse("2019-02-22 12:00"), "price": 200, "negotiable": true, "location": "43 Bedok Reservoir Road, Singapore", "longitude": 103.91116349999993, "latitude": 1.3317482},
4    {"user_id": 5, "task_name": "How do i cook this!?!", "task_description": "I need someone to teach me how to cook Beef Wellington", "start_time": DateTime.parse("2019-06-15 13:00"), "price": 388, "negotiable": true, "location": "278 Marine Parade Road, Singapore", "longitude": 103.90959580000003, "latitude": 1.3048821},
5    {"user_id": 3, "task_name": "Need someone who knows how 2 cycle", "task_description": "I need someone to teach my kids how to cycle while i prepare lunch", "start_time": DateTime.parse("2019-04-30 12:30"), "price": 15, "negotiable": false, "location": "143 Old Airport Road, Singapore", "longitude": 103.8884167, "latitude": 1.3084057},
6    {"user_id": 2, "task_name": "Need two strong guys to help move stuff", "task_description": "Require 2 man to help me move my furniture to my new flat", "start_time": DateTime.parse("2019-12-12 08:00"), "price": 10, "negotiable": true, "location": "89 East Coast Road, Singapore", "longitude": 103.90402429999995, "latitude": 1.3054691},
7    {"user_id": 1, "task_name": "Looking for someone to look after my pets", "task_description": "I need someone trustworthy to look after my pets while i'm on vacation", "start_time": DateTime.parse("2019-09-21 10:00"), "price": 40, "negotiable": false, "location": "89 East Coast Avenue, Singapore", "longitude": 103.92532400000005, "latitude": 1.3106426},
8    {"user_id": 1, "task_name": "Help me with my homework", "task_description": "Need some1 smart to do my homework for me", "start_time": DateTime.parse("2019-03-12 20:00"), "price": 90, "negotiable": true, "location": "5 Paya Lebar Road, Singapore", "longitude": 103.892698, "latitude": 1.316645},
9    {"user_id": 4, "task_name": "Looking for an artist", "task_description": "I would like a talented artist to help draw a family portrait for me", "start_time": DateTime.parse("2019-11-11 14:00"), "price": 12, "negotiable": false, "location": "20 Upper Serangoon Road, Singapore", "longitude": 103.86888870000007, "latitude": 1.3291749},
10    {"user_id": 5, "task_name": "Need personal driver for the day", "task_description": "I need someone with a car to drive me around for the day", "start_time": DateTime.parse("2019-09-09 08:00"), "price": 33, "negotiable": false, "location": "339 Jalan Besar, Singapore", "longitude": 103.85935670000003, "latitude": 1.3119243},
11   {"user_id": 3, "task_name": "Looking for good looking guys", "task_description": "I would like a well-groomed guy to act as my boyfriend for the day to fool my parents", "start_time": DateTime.parse("2019-02-28 18:00"), "price": 22.50, "negotiable": false, "location": "77 Rangoon Road, Singapore", "longitude": 103.8540769, "latitude": 1.3138078},
12    {"user_id": 5, "task_name": "LFM CS party", "task_description": "I need four silver eagles to join up and party in Counter-Strike", "start_time": DateTime.parse("2019-12-02 21:00"), "price": 30, "negotiable": false, "location": "756 Upper Serangoon Road, Singapore", "longitude": 103.87865039999997, "latitude": 1.3539782},
13    {"user_id": 5, "task_name": "Need someone to take my kids to the zoo", "task_description": "Looking for someone to help take my kids to the zoo", "start_time": DateTime.parse("2019-05-28 11:00"), "price": 42, "negotiable": true, "location": "66 Lorong Ah Soo, Singapore", "longitude": 103.88243149999994, "latitude": 1.350856},
14    {"user_id": 2, "task_name": "Dog Walker required", "task_description": "Looking for a professional dog walker to walk both my dogs", "start_time": DateTime.parse("2019-11-01 09:00"), "price": 16, "negotiable": true, "location": "279 Upper Serangoon Road, Singapore", "longitude": 103.86950030000003, "latitude": 1.3374094},
15    {"user_id": 2, "task_name": "Looking for calefare", "task_description": "Need someone to stand in for my FYP video as the last guy stood us up", "start_time": DateTime.parse("2019-05-14 15:00"), "price": 150, "negotiable": false, "location": "128 Braddell Road, Singapore", "longitude": 103.86402120000002, "latitude": 1.3442701},
16    {"user_id": 1, "task_name": "Professional Photographer wanted", "task_description": "Looking for a professional photographer to take shots for my modeling portfolio", "start_time": DateTime.parse("2019-03-20 16:00"), "price": 39, "negotiable": true, "location": "110A Lorong 1 Toa Payoh, Singapore", "longitude": 103.84614599999998, "latitude": 1.341966},
17    {"user_id": 3, "task_name": "Looking for experienced programmer", "task_description": "I need someone experienced with Java and PHP to help with my website", "start_time": DateTime.parse("2019-03-15 10:00"), "price": 10, "negotiable": true, "location": "54 Ang Mo Kio Avenue 10, Singapore", "longitude": 103.85734060000004, "latitude": 1.3686292},
18    {"user_id": 1, "task_name": "Looking for delivery guy", "task_description": "Looking for someone to buy food for my disabled dad", "start_time": DateTime.parse("2019-07-11 12:00"), "price": 10, "negotiable": true, "location": "993B Yio Chu Kang Road, Singapore", "longitude": 103.87776800000006, "latitude": 1.355344},
19    {"user_id": 4, "task_name": "Need a babysitter", "task_description": "Will be away for sometime, need someone to babysit my kids", "start_time": DateTime.parse("2019-07-25 09:00"), "price": 65, "negotiable": true, "location": "987B Buangkok Green, Singapore", "longitude": 103.87831069999993, "latitude": 1.3794154},
20    {"user_id": 5, "task_name": "Help wanted, 9-5", "task_description": "I need someone to stand-in as a waiter for the day", "start_time": DateTime.parse("2019-11-23 08:00"), "price": 45, "negotiable": false, "location": "88 Gerald Drive, Singapore", "longitude": 103.87796730000002, "latitude": 1.3858756},
21    {"user_id": 1, "task_name": "Looking for help with building computers", "task_description": "Need an experienced person to help me build my computer for me", "start_time": DateTime.parse("2019-09-30 17:00"), "price": 25, "negotiable": false, "location": "865 Tampines Street 81, Singapore", "longitude": 103.93161970000006, "latitude": 1.34968},
22    {"user_id": 2, "task_name": "Need help cooking dinner", "task_description": "I need someone professional to help me cook a romantic dinner for my and my girlfriend for our anniversary", "start_time": DateTime.parse("2019-10-11 16:00"), "price": 18, "negotiable": true, "location": "654A Senja Road, Singapore", "longitude": 103.76417400000003, "latitude": 1.387535},
23    {"user_id": 3, "task_name": "Looking for someone to watch a movie together", "task_description": "Feeling lonely, looking for someone to accompany me to the movies", "start_time": DateTime.parse("2019-08-25 20:45"), "price": 6, "negotiable": true, "location": "544 Sixth Avenue, Singapore", "longitude": 103.78882499999997, "latitude": 1.319638},
24    {"user_id": 4, "task_name": "Need help carrying stuff", "task_description": "I need someone to help me carry stuff around for the day", "start_time": DateTime.parse("2019-08-02 08:00"), "price": 5, "negotiable": false, "location": "432 Race Course Road, Singapore", "longitude": 103.85789899999997, "latitude": 1.315743},
25    {"user_id": 2, "task_name": "Looking for professional Bartender", "task_description": "Reasonable pay given, urgent", "start_time": DateTime.parse("2019-06-02 18:00"), "price": 250, "negotiable": true, "location": "324 Lavender Street, Singapore", "longitude": 103.85916399999996, "latitude": 1.315665}
])

Taskee.create!([
    {"task_id": 1, "user_id": 2},
    {"task_id": 2, "user_id": 1},
    {"task_id": 3, "user_id": 5},
    {"task_id": 4, "user_id": 1},
    {"task_id": 5, "user_id": 4},
    {"task_id": 6, "user_id": 1},
    {"task_id": 7, "user_id": 5},
    {"task_id": 8, "user_id": 2},
    {"task_id": 9, "user_id": 5},
    {"task_id": 10, "user_id": 1},
    {"task_id": 11, "user_id": 2},
    {"task_id": 12, "user_id": 3},
    {"task_id": 13, "user_id": 3},
    {"task_id": 14, "user_id": 1},
    {"task_id": 15, "user_id": 3},
    {"task_id": 16, "user_id": 2},
    {"task_id": 17, "user_id": 4},
    {"task_id": 18, "user_id": 2},
    {"task_id": 19, "user_id": 5},
    {"task_id": 20, "user_id": 4},
    {"task_id": 21, "user_id": 2},
    {"task_id": 22, "user_id": 1},
    {"task_id": 23, "user_id": 4},
    {"task_id": 24, "user_id": 3},
    {"task_id": 25, "user_id": 3}
])