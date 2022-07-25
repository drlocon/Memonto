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
    {content: '町の灯は、暗の中だってこわくない', feeling: 'happy', end_user_id: users[0].id},
    {content: 'ゆらゆらと青い焔のように見えます', feeling: 'anger', end_user_id: users[0].id},
    {content: '汽車はぼんやりと白く見えるだけだ', feeling: 'sorrow', end_user_id: users[0].id},
    {content: '水銀は蒸発して風が流れて来るんだ', feeling: 'normal', end_user_id: users[1].id},
    {content: '青い胸あてをしたっての知っている', feeling: 'tired', end_user_id: users[1].id},
    {content: 'その星はみな、涙に吹き込みました', feeling: 'happy', end_user_id: users[1].id},
    {content: 'くっきり白い羽根は前へ行きました', feeling: 'anger', end_user_id: users[2].id},
    {content: '指を一本あげてくるくるとまわった', feeling: 'sorrow', end_user_id: users[2].id},
    {content: 'この頁一つを見てにこにこわらった', feeling: 'normal', end_user_id: users[2].id},
    {content: '向こうからぱっと白く明るくなった', feeling: 'tired', end_user_id: users[3].id},
    {content: '地平線の上でけむったように思った', feeling: 'happy', end_user_id: users[3].id},
    {content: '幸福なそのひとのために祈っている', feeling: 'anger', end_user_id: users[3].id}
  ]
)

tags = Tag.create!(
  [
    {name: 'ダミー'},
    {name: 'Dummy'},
    {name: 'テスト'},
    {name: 'TEST'}
  ]
)

TagDocument.create!(
  [
    {tag_id: tags[0].id, document_id: documents[0].id},
    {tag_id: tags[0].id, document_id: documents[1].id},
    {tag_id: tags[1].id, document_id: documents[2].id},
    {tag_id: tags[1].id, document_id: documents[3].id},
    {tag_id: tags[1].id, document_id: documents[4].id},
    {tag_id: tags[2].id, document_id: documents[5].id},
    {tag_id: tags[2].id, document_id: documents[6].id},
    {tag_id: tags[2].id, document_id: documents[7].id},
    {tag_id: tags[3].id, document_id: documents[8].id},
    {tag_id: tags[3].id, document_id: documents[9].id},
    {tag_id: tags[3].id, document_id: documents[10].id},
    {tag_id: tags[0].id, document_id: documents[11].id}
  ]
)