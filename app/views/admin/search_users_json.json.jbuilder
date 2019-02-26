json.array!(@users) do |u|
    json.name    u.name
    json.id      u.id
end