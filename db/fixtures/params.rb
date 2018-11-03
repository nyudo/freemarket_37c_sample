User.seed do |u|
  u.id = 1
  u.nickname = "NICK"
  # u.family_name = "nick"
  # u.first_name = "name"
  # u.kana_family_name = "ニック"
  # u.kana_first_name = "ネーム"
  u.email = "nickname@example.com"
  u.password = "nickname"
  # u.birthday = "2018/10/12"
  # u.prefecture = 1
  # u.city = "渋谷区"
  # u.address = 111
  # u.residential_name = "渋谷ビル"
  # u.phone_number = 909111
  # u.postal_code = 3631111
  # u.profile = "こんにちは"
  u.user_detail_id = "1"
end

User.seed do |u|
  u.id = 2
  u.nickname = "AAAAAA"
  u.email = "AAAAAA@example.com"
  u.password = "AAAAAA"
end

User.seed do |u|
  u.id = 3
  u.nickname = "BBBBBB"
  u.email = "BBBBBB@example.com"
  u.password = "BBBBBB"
end

User.seed do |u|
  u.id = 4
  u.nickname = "CCCCCC"
  u.email = "CCCCCC@example.com"
  u.password = "CCCCCC"
end

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

LargeCategory.seed do |s|
  s.id = 1
  s.large_category = "レディース"

end
LargeCategory.seed do |s|
  s.id = 2
  s.large_category = "メンズ"

end

MediumCategory.seed do |s|
  s.id = 1
  s.medium_category = "トップス"

end
MediumCategory.seed do |s|
  s.id = 2
  s.medium_category = "ジャケット/アウター"

end

SmallCategory.seed do |s|
  s.id = 1
  s.small_category = "Tシャツ/カットソー(半袖/袖なし)"

end
SmallCategory.seed do |s|
  s.id = 2
  s.small_category = "Tシャツ/カットソー(七分/長袖)"

end


