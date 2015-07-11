# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

View.delete_all
View.create(
  name_en: 'Home',
  name_ua: 'Главная',
  view_type: 'view',
)
View.create(
  name_en: 'Default',
  name_ua: 'По умолчанию',
  view_type: 'view',
)

Page.delete_all
Page.create(
    name_en: 'Page 1',
    short_content_en: 'Short content content content content content',
    content_en: 'Content content content content content',
    name_ua: 'Сторінка 1',
    short_content_ua: 'Short контент контент content content content',
    content_ua: 'Content контент content контент content',
  )
Page.create(
    name: 'Page 2',
    short_content: 'Short content 2 content 2 content 2 content content',
    content: 'Content 2 content 2 content 2 content 2 content 2',
    name_ua: 'Сторінка 22',
    short_content_ua: 'Short контент 2 контент контент контент контент',
    content_ua: 'Content контент 2 контент контент контент',
)