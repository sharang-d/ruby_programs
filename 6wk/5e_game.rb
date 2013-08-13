def save_game(file)
  score = 1000
  open(file, "w") do |f|
    f.puts(score)
    f.puts(Time.new.to_i)
  end
end

def load_game(file)
  data = open(file) { |f| f.readlines }
  begin
    if data.last.to_i != File.stat(file).mtime.to_i
      raise RuntimeError, 'I suspect you of cheating'
    end
    puts "Your saved score is #{data.first}"
  rescue RuntimeError => r
    puts "#{r.class}: #{r.message}"
  end
end

save_game('raw/game.sav')
sleep(2)
load_game('raw/game.sav') # => "Your saved score is 1000."
# Now let's cheat by increasing our score to 9000
open('raw/game.sav', 'r+b') { |f| f.write("9") }
load_game('raw/game.sav') # RuntimeError: I suspect you of cheating.
