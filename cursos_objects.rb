require 'date'
class Course
    attr_reader :datei, :datef
    def initialize(name, datei, datef)
        @name = name
        @datei = datei
        @datef = datef
    end

    def date_before(date_comparation = Date.today)
        raise ArgumentError.new('Alerta, fecha recibida es igual a 2018-01-01') if date_comparation == 2018-01-01
        [@datei, @datef].select{|date| date < date_comparation}
    end

    def date_after(date_comparation = Date.today)
        raise ArgumentError.new('Alerta, fecha recibida es igual a 2018-01-01') if date_comparation == 2018-01-01
        [@datei, @datef].select{|date| date > date_comparation}
    end
end

def initialize_data 
    output = []
    data =[]
    File.open('cursos.txt', 'r') {|file| data = file.readlines}

    data.each do |line|
        output.push(Course.new(line.split(', ')[0], Date.parse(line.split(', ')[1]), Date.parse(line.split(', ')[2]))) #No me deja usar el .map directamente en el ojbeto
    end
    return output
end

initialize_data.each do |value|
    print value.date_before()
    print "\n"
end

initialize_data.each do |value|
    print value.date_after(2018-01-01)
    print "\n"
end