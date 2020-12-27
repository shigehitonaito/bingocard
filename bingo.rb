require "../bingocard/bingo_game"

class Bingo
	# クラスの外からcardが参照できるようにアクセサメソッドに定義
	attr_accessor :card
	include Game

	# Bingoクラスに対しnewメソッドが使用されると@card(クラスインスタンス変数)にビンゴカードが作成される
	def initialize
		@card = %w(B I N G O ).map{|n| n.rjust(2)}.join("|")
		@card += "\n"

		b = (1..15).to_a.sample(5)
		i = (16..30).to_a.sample(5)
		n = (31..45).to_a.sample(5)
		n[2] = " "
		g = (46..60).to_a.sample(5)
		o = (61..75).to_a.sample(5)

		5.times do |t|
			[b,i,n,g,o].each do |int|
				@card += int[t].to_s.rjust(2)
				# rangeクラスのcoverメソッドを使用し、61~75までの数字の後には”|”を付けないようにする
				@card += (61..75).cover?(int[t])? "" : "|"
			end

			@card +=  "\n"
		end
	end

end


print text = <<~TEXT
\nようこそ！!
ビンゴカードの表示のみの場合はcard
ビンゴゲームを行う場合はstartと入力してください。\n
TEXT

select = gets.chomp
puts "\n"

case select
when "card"
	bingo = Bingo.new
	puts bingo.card
when "start"
	bingo = Bingo.new
	bingo.intro
	puts bingo.card
	10.times do |t|
		num =  (1..75).to_a.sample(1)
		puts "\n#{num}がカード内にある方は穴を開けてください。\n"
		bingo.check(num)
	end
end












# 作成手順
# ビンゴカード作成
# ゲームスタート
# イントロダクション
# 数字ランダム表示
# ビンゴカードの数字をバラして数字と比較
# ==だったら" "を入れる










