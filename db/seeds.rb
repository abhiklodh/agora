user_one = User.create(
  email: 'hubermartina@web.de',
  first_name: 'Martina',
  last_name: 'Huber',
  password: "myPassword",
  password_confirmation: "myPassword"
)

user_two = User.create(
  email: 'holgermartens@web.de',
  first_name: 'Holger',
  last_name: 'Martens',
  password: "myPassword",
  password_confirmation: "myPassword"
)

institution_one = Institution.create(
  user_id: user_one.id,
  title: 'Charité Berlin',
  kind: 0,
  street: 'Charitépl. 1',
  postcode: '10117',
  city: 'Berlin'
)

institution_two = Institution.create(
  user_id: user_two.id,
  title: 'Praxis Dr. Frühling',
  kind: 1,
  street: 'Invalidenstraße 3',
  postcode: '10115',
  city: 'Berlin'
)

item_one = Item.create(
  kind: 0,
  status: 0,
  name: 'Mundschutz',
  amount: 3,
  institution_id: institution_one.id
)

item_two = Item.create(
  kind: 0,
  status: 1,
  name: 'Desinfektionsmittel 500ml Flaschen',
  amount: 5,
  institution_id: institution_one.id
)

item_three = Item.create(
  kind: 0,
  status: 2,
  name: 'Beatmungsgerät',
  amount: 7,
  institution_id: institution_one.id
)

item_four = Item.create(
  kind: 1,
  status: 0,
  name: 'Handschuhe',
  amount: 9,
  institution_id: institution_two.id
)

chat_one = Chat.create(
  sender_id: user_one.id,
  recipient_id: user_two.id
  # ,
  # items: [item_one.id, item_two.id, item_three.id]
)

message_one = Message.create(
  chat_id: chat_one.id,
  user_id: user_two.id,
  text: 'Ich könnte ihnen weiterhelfen...'
)

message_two = Message.create(
  chat_id: chat_one.id,
  user_id: user_one.id,
  text: 'Danke für Ihr Angebot'
)
