def all_words_capitalized?(array)
    array.all? { |word| word == word.capitalize}
end

def no_valid_url?(array)
    valid_urls = [".com", ".net", ".io", ".org"]

    array.none? do |url| 
        index = url.index(".")
        url_ending = url[index..-1]
        valid_urls.include?(url_ending)
    end
end

def any_passing_students?(students)
    students.any? do |student|
        avg_grade = student[:grades].sum / (student[:grades].length * 1.0)
        avg_grade >= 75
    end
end