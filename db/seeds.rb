user = User.find_or_create_by(email: 'user@example.com') do |u|
  u.password = "password"
end

deck = user.decks.new
deck.name = "imported from file" + Faker::Lorem.word
deck.description = Faker::Lorem.sentence
deck.save!

csv_text = File.read(Rails.root.join('lib', 'seeds', 'import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  deck.cards.create!(
    front: row['front'],
    back: row['back'],
    word_class: row['word_class'],
    created_at: Date.today,
    updated_at: Date.today,
    last_showed_at: Date.today
  )
  print '.'
end
