# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
   email: 'test@hoge.com',
   password: 'testhoge',
)

Genre.create([
    { name: '醤油' },
    { name: '塩' },
    { name: 'みそ'},
    { name: '豚骨'},
    { name: 'つけ麺'},
    { name: '魚介'},
    { name: '豚骨醤油'},
    { name: 'チャーシュー麺'},
    { name: '家系'},
    { name: '塩豚骨'},
    { name: 'にぼし'},
    { name: '担々麺'},
    { name: 'ちゃんぽん'},
    { name: '油そば'},
    ])