json.array! @animes do |anime|
  json.id    anime.id
  json.title anime.title
  json.genre anime.category.name
  json.image anime.image
end

