json.array! @foodies.each do |foodie|
  json.id foodie.id
  json.name foodie.name
  json.email foodie.email
  json.isCurrentUser foodie.id == current_foodie.id
end