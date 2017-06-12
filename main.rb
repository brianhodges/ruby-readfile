load 'team.rb'
filename = 'top3list.csv'
teams = []
delim = '+'

puts
puts 'Filename: ' + filename
puts 'Modified At: ' + File.mtime(filename).strftime('%Y-%m-%d %I:%M %p')
puts

content = File.open(filename).read
content.each_line do |line|
	t1 = line.split(',')[0].strip
	t2 = line.split(',')[1].strip
	teams << Team.new(t1, t2)
end

teams.each do |team|
	s = ('| Team: ' + team.name + ' |').size - 2
	puts delim + ('-' * s) + delim
	puts '| Team: ' + team.name + ' |'
	s2 = ('| Super Bowl Wins: ' + team.super_bowl_wins).size
	puts '| Super Bowl Wins: ' + team.super_bowl_wins + (' ' * (s - s2)) + ' |'
	puts delim + ('-' * s) + delim
	puts
end