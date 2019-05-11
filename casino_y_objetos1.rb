class Table
    def initialize(name, collection1, collection2, collection3, collection4)
        @name = name
        @collection1 = collection1.to_i
        @collection2 = collection2.to_i
        @collection3 = collection3.to_i
        @collection4 = collection4.to_i
    end

    def max_date
        arr = [@collection1, @collection2, @collection3, @collection4]
        return @name, arr.max, "Día #{arr.index(arr.max) + 1}", "Promedio = #{arr.inject(0.0){|sum, e| sum + e }/arr.size}"
    end
end

def data_instance
    output = []
    data =[]
    File.open('casino.txt', 'r') {|file| data = file.readlines}

    data.each do |col|
        output.push(Table.new(col.split(',')[0], col.split(',')[1], col.split(',')[2], col.split(',')[3], col.split(',')[4]))
    end
    return output
end

data_instance.each do |e|
   print e.max_date
   print "\n"
end
