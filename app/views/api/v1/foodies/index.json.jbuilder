json.array! @foodies.each do |foodie|
  json.id foodie.id
  json.name foodie.name
  json.email foodie.email
  json.avatar  foodie.avatar.url
  json.thumb foodie.avatar.url(:thumb)
  json.isCurrentUser foodie.id == current_foodie.id
end