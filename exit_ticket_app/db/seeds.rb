# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Program.destroy_all

User.create!([
  {first_name: "Andy", last_name: "Whitley", email: "andrew.whitley@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Adrian", last_name: "Maseda", email: "adrian.maseda@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Nayana", last_name: "Davis", email: "nayana.davis@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Matt", last_name: "Brems", email: "matt.brems@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Joe", last_name: "Nelson", email: "joseph.nelson@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Ritika", last_name: "Bhasker", email: "ritika.bhasker@generalassemb.ly", password: "password", is_producer?: false},
  {first_name: "Phil", last_name: "Ahn", email: "philip.ahn@generalassemb.ly", password: "password", is_producer?: true}
])

Program.create!([
  {name: "WDI13", location: "D.C. Campus, Classroom 6", is_active?: false},
  {name: "WDI14", location: "D.C. Campus, Classroom 5", is_active?: true},
  {name: "DSI3", location: "D.C. Campus, Classroom 1", is_active?: false},
  {name: "DSI4", location: "D.C. Campus, Classroom 5", is_active?: true}
])

Membership.create!([
  {user_id: 1, program_id: 1},
  {user_id: 1, program_id: 2},
  {user_id: 2, program_id: 1},
  {user_id: 2, program_id: 2},
  {user_id: 3, program_id: 1},
  {user_id: 3, program_id: 2},
  {user_id: 4, program_id: 3},
  {user_id: 4, program_id: 4},
  {user_id: 5, program_id: 3},
  {user_id: 5, program_id: 4},
  {user_id: 6, program_id: 3},
  {user_id: 6, program_id: 4},
  {user_id: 7, program_id: 1},
  {user_id: 7, program_id: 2},
  {user_id: 7, program_id: 3},
  {user_id: 7, program_id: 4}
])

Lesson.create!([
  {number: 1, name: "Intro to WDI13", date: Date.parse('2016-10-15'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(1), program_id: 1},
  {number: 2, name: "Javascript 1", date: Date.parse('2016-10-16'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(2), program_id: 1},
  {number: 3, name: "Javascript 2", date: Date.parse('2016-10-17'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(3), program_id: 1},
  {number: 1, name: "Intro to WDI14", date: Date.parse('2016-12-04'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(3), program_id: 2},
  {number: 2, name: "Javascript 1", date: Date.parse('2016-12-05'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(2), program_id: 2},
  {number: 3, name: "Javascript 2", date: Date.parse('2016-12-06'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(1), program_id: 2},
  {number: 1, name: "Intro to DSI3", date: Date.parse('2016-10-22'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(4), program_id: 3},
  {number: 2, name: "Python 1", date: Date.parse('2016-10-23'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(5), program_id: 3},
  {number: 3, name: "Python 2", date: Date.parse('2016-10-24'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(6), program_id: 3},
  {number: 1, name: "Intro to DSI4", date: Date.parse('2017-01-12'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(6), program_id: 4},
  {number: 2, name: "Python 1", date: Date.parse('2017-01-13'), start_time: Time.parse("10:00"), end_time: Time.parse("12:30"), instructor: User.find(5), program_id: 4},
  {number: 3, name: "Python 2", date: Date.parse('2017-01-14'), start_time: Time.parse("14:30"), end_time: Time.parse("17:00"), instructor: User.find(4), program_id: 4}
])

positive_comments = [
  "My instructor seems so knowledgable. He's definitely helped me to improve my skills",
  "The class was great! It seems so applicable to what I want to do in the future.",
  "I loved being able to implement skills on my own through exercises",
  "My instructor answered all of my questions and made sure the class understood each concept before we moved on.",
  "I am so happy I chose to do this class. I am learning more than I could have imagined each and every day.",
  "The lesson was well-organized and delivered very smoothly.",
  "The lecture was clear to me and very well prepared",
  "I love how my teacher makes learning new skills so much fun. I look forward to each class.",
  "I really appreciate all of the individual attention that my instructors provide. It really helps me work through complex material.",
  "Great class, teacher, and materials!"
]

negative_comments = [
  "The teacher seemed unprepared",
  "The lesson moved too quickly for me to understand",
  "I had a hard time paying attention for the full class period",
  "I wish more individual attention was provided",
  "The teacher did not answer my questions when I raised my hand. It really made me feel like I didn't matter. I was expecting more considering how much I'm paying to be here.",
  "I already knew most of what was presented and was hoping for something more complex",
  "I don't feel like what I learned is applicable to the real world",
  "The class started late and seemed disorganized",
  "The instructor moved too quickly and didn't take time to allow for questions",
  "I would have liked more opportunities to implement skills myself through exercises and activities"
]

general_comments = [
  "Nothing to add, very happy with my decision to come to GA",
  "Outcomes is great too!",
  "I love the PB & J's!",
  "We should have more happy hours",
  "I wish there were other options than just peanut butter and jelly sandwiches",
  "N/A",
  "I really like the community that GA provides with happy hours and networking events"
]

Lesson.all.each do |lesson|
  lesson.surveys.create!([
    {respondent_name: "Bill Nye", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "Barack Obama", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "George Washington", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: nil, attended_office_hours: [true, false].sample},
    {respondent_name: "Albert Einstein", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "Neil Armstrong", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: nil, attended_office_hours: [true, false].sample},
    {respondent_name: "Katie Couric", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "Duke Ellington", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "Marvin Gaye", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: nil, attended_office_hours: [true, false].sample},
    {respondent_name: "Euphemia Hayes", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: general_comments.sample, attended_office_hours: [true, false].sample},
    {respondent_name: "Anonymous", lo_rating: rand(1..10), delivery_rating: rand(1..10), comfort_rating: rand(1..10), positive_comment: positive_comments.sample, negative_comment: negative_comments.sample, general_comment: nil, attended_office_hours: [true, false].sample}
  ])
end
