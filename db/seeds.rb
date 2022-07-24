# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント
Admin.create!(
  email: 'admin@example.com',
  password: 'memonto'
)

# テストデータ
users = EndUser.create!(
  [
    {email: 'daisy@test.com', name: 'Daisy', password: 'dai4y8', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'tubaki@test.com', name: 'Tubaki', password: 'tu3k1y', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'acacia@test.com', name: 'Acacia', password: 'aca4ay', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
    {email: 'viola@test.com', name: 'Viola', password: 'vio7fd2', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")}
  ]
)

documents = Document.create!(
  [
    {content: '町の灯は、暗の中だってこわくない', feeling: 'happy', end_user_id: users[0].id },
    {content: '水銀は蒸発して風が流れて来るんだ', feeling: 'anger', end_user_id: users[1].id },
    {content: 'くっきり白い羽根は前へ行きました', feeling: 'normal', end_user_id: users[2].id },
    {content: '向こうからぱっと白く明るくなった', feeling: 'tired', end_user_id: users[3].id }
  ]
)

tags = Tag.create!(
  [
    {name: 'ダミー1'},
    {name: 'ダミー2'},
    {name: 'ダミー3'},
    {name: 'ダミー4'}
  ]
)

TagDocument.create!(
  [
    {tag_id: tags[0].id, document_id: documents[0].id},
    {tag_id: tags[1].id, document_id: documents[1].id},
    {tag_id: tags[2].id, document_id: documents[2].id},
    {tag_id: tags[3].id, document_id: documents[3].id}
  ]
)