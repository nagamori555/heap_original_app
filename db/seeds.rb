n = 1
t = 10
100.times do |n|
  Leveltable.create(level: "#{n + 1}", threshold:"#{t = t * 1.1}")
end