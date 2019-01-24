json.array!(@units) do |u|
    json.name       u.name
    json.category   u.category
end