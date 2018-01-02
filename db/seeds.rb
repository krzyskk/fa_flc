
30.times do |i|
  card = Card.new
  word = Faker::Lorem.word
  card.front = 'q_' + word
  card.back = 'a_' + word
  card.created_at = Faker::Date.between(6.years.ago, 1.days.ago)
  card.updated_at = Faker::Date.between(card.created_at, Date.today)
  card.last_showed_at = Faker::Date.between(card.created_at, Date.today)
  card.save!
  print '.'
end
