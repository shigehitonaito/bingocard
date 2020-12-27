
class Bingo
	include check

	title = %w(B I N G O ).map{|n| n.rjust(3)}.join("|")
	puts title

	b = (1..15).to_a.sample(5)
	i = (16..30).to_a.sample(5)
	n = (31..45).to_a.sample(5)
	n[2] = " "
	g = (46..60).to_a.sample(5)
	o = (61..75).to_a.sample(5)



	5.times do |t|
		[b,i,n,g,o].each do |int|
			print  int[t].to_s.rjust(3)
			print (61..75).cover?(int[t])? "" : "|"
		end

		puts "\n"
	end
end

bingo = Bingo.new

puts bingo





