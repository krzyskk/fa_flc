user = User.find_or_create_by(email: 'user@example.com')
user.password = 'password'
user.password_confirmation = 'password'
user.save!

deck = user.decks.new
deck.name = "imported from file" + Faker::Lorem.word
deck.description = Faker::Lorem.sentence
deck.save!

csv_text = File.read(Rails.root.join('lib', 'seeds', 'import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  card = deck.cards.new
  card.front = row['front']
  card.back = row['back']
  card.created_at = Date.today
  card.updated_at = Date.today
  card.last_showed_at = Date.today
  card.save!
  print '.'
end
