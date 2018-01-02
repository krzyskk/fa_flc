
30.times do |i|
  card = Card.new
  word = Faker::Lorem.word
  card.front = 'q_' + word
  card.back = 'a_' + word
  card.created_at = Faker::Date.between(6.years.ago, 1.days.ago)
  card.updated_at = Faker::Date.between(card.created_at, Date.today)
  card.correct_answers = 1 + rand(15)
  card.showed_questions = card.correct_answers + rand(20)
  card.last_showed_at = Faker::Date.between(card.created_at, Date.today)
  card.save!
  print '.'
end
