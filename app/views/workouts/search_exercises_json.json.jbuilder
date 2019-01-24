json.array!(@exercises) do |e|
    json.name       e.name
    json.category      e.category
end