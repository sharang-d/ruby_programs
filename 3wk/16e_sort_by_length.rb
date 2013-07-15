a = ["Magazine", "Sunday", "Jump"]
p a.sort
p a.sort { |s| s }
p a.sort { |l, r| l <=> r }
p a.sort { |l, r| l.length <=> r.length }
p a.sort_by { |s| s }
p a.sort_by { |s| s.length }
