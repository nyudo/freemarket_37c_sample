5.times {
  User.seed do |u|
    u.nickname = Faker::Internet.username(1..6)
    u.email = Faker::Internet.email
    u.password = Faker::Internet.password
  end
}

UserDetail.seed do |u|
  u.id = 1
  u.family_name = "nick"
  u.first_name = "name"
  u.kana_family_name = "ニック"
  u.kana_first_name = "ネーム"
  u.birthday = "2018/10/12"
  u.prefecture = 1
  u.city = "渋谷区"
  u.address = 111
  u.residential_name = "渋谷ビル"
  u.phone_number = 909111
  u.postal_code = 3631111
  u.profile = "こんにちは"
end

LargeCategory.seed(:id,
{id: 1, large_category: "レディース"},
{id: 2, large_category: "メンズ"},
  )


MediumCategory.seed(:id,
{id: 1, medium_category: "トップス"},
{id: 2, medium_category: "ジャケット/アウター"},
  )



SmallCategory.seed(:id,
{id: 1, small_category: "Tシャツ/カットソー(半袖/袖なし)"},
{id: 2, small_category: "Tシャツ/カットソー(七分/長袖)"},
  )



# User.seed(:id,
# {id: 1, nickname: "NICK",email: "nickname@example.com",password:"nickname"},
# {id: 2, nickname: "AAAAAA",email: "AAAAAA@example.com",password:"AAAAAA"},
# {id: 3, nickname: "BBBBBB",email: "BBBBBB@example.com",password:"BBBBBB"},
# {id: 4, nickname: "CCCCCC",email: "CCCCCC@example.com",password:"CCCCCC"},
# {id: 5, nickname: "DDDDDD",email: "DDDDDD@example.com",password:"DDDDDD"},
#   )
# 5.times do
#      User.create(
#         nickname: Faker::DragonBall.character,
#         email: Faker::Internet.email,
#         password: Faker::Address.postcode,  #integer
#       )
# end

# User.seed do |u|
#   u.id = 1
#   u.nickname = "NICK"
#   # u.family_name = "nick"
#   # u.first_name = "name"
#   # u.kana_family_name = "ニック"
#   # u.kana_first_name = "ネーム"
#   u.email = "nickname@example.com"
#   u.password = "nickname"
#   # u.birthday = "2018/10/12"
#   # u.prefecture = 1
#   # u.city = "渋谷区"
#   # u.address = 111
#   # u.residential_name = "渋谷ビル"
#   # u.phone_number = 909111
#   # u.postal_code = 3631111
#   # u.profile = "こんにちは"
#   u.user_detail_id = "1"
# end

# User.seed do |u|
#   u.id = 2
#   u.nickname = "AAAAAA"
#   u.email = "AAAAAA@example.com"
#   u.password = "AAAAAA"
# end

# User.seed do |u|
#   u.id = 3
#   u.nickname = "BBBBBB"
#   u.email = "BBBBBB@example.com"
#   u.password = "BBBBBB"
# end

# User.seed do |u|
#   u.id = 4
#   u.nickname = "CCCCCC"
#   u.email = "CCCCCC@example.com"
#   u.password = "CCCCCC"
# end



