class Roulette
    def initialize(number)
        @number = number
    end

    def play(gamble_number = rand(1..10))
        roulette_number = @number[rand(0..9)]
        print "Ruleta = #{roulette_number}\nApuesta = #{gamble_number}\n"
        File.write('winners.txt', "#{roulette_number}\n", File.size('winners.txt'), mode: 'a') if roulette_number == gamble_number
        File.write('roulette_history.txt', "#{roulette_number}\n", File.size('roulette_history.txt'), mode: 'a')
    end

    def roulette_history
        data = []
        File.open('roulette_history.txt', 'r') {|file| data = file.readlines}
        freq = data.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        return data.max_by { |v| freq[v] }

    end
end

r = Roulette.new((1..10).to_a)
r.play()
print "El número mas repetido de la ruleta es = #{r.roulette_history()}"
