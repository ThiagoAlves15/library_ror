puts 'create admin'

User.first_or_create(
  name: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin',
  role: :admin
)

puts 'create some users'

for i in 1..50 do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Alphanumeric.alpha(number: 8),
    role: :client
  )
end

puts 'create some books'

for i in 1..200 do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    category: Faker::Book.genre
  )
end

puts 'create some reserves'

for i in 1..50 do
  Reserve.create!(
    user: User.clients.sample,
    book: Book.available.sample,
    reserve_date: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    devolution_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 3),
    status: [0, 1, 2].sample
  )
end
