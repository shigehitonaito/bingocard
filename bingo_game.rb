
module Game

	def intro
		print introduction = <<~TEXT
		\nこれからビンゴゲームを始めます。
		あなたのカードはこちらです。\n
			TEXT
	end

	def check(num)
		if (61..75).cover?(num.last.to_s.to_i)
			puts @card.gsub!(/[^0-9]#{num.last.to_s}[^0-9]/, "| \n".rjust(2))
		elsif (1..15).cover?(num.last.to_s.to_i)
			puts @card.gsub!(/[^0-9\n]#{num.last.to_s}[^0-9]/, "  |".rjust(2))
		elsif (16..60).cover?(num.last.to_s.to_i)
			puts @card.gsub!(/[^0-9]#{num.last.to_s}[^0-9]/, "|  |".rjust(2))
		end
	end

end