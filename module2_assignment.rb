#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class.
  attr_reader :highest_wf_count #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  attr_reader :highest_wf_words #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  attr_reader :content          #* content          - the string analyzed (provided)
  attr_reader :line_number      #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.
  def initialize(content, line_number)
    # I would argue to your teacher that this class has no need for line number. It does nothing with it, it simply
      # stores it. Really Line number is a property which the calling class **may** care about, and as such it should
      # be left to the calling class to handle it.
    @content = content
    @line_number = line_number
    # automatically analyze the line which will populate the highest_wf_* vars
    calculate_word_frequency()
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
  def calculate_word_frequency
    # not a class method, it is used to poulate wahat are essentially properties on an instance of the class
    word_frequency = @content.split(" ").each_with_object(Hash.new(0)) {|word,count| count[word] +=1}
    @highest_wf_count = word_frequency.values.max
    # prefer select over reject - positive logic always more clear than negative
    @highest_wf_words = word_frequency.select { |word, freq| freq == @highest_wf_count }.keys
   puts @highest_wf_words
   puts "-------"
  end
end



# That's it on the LineAnalyzer class. pretty simple

#  Implement a class called Solution.
class Solution
  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers  #* analyzers - an array of LineAnalyzer objects for each line in the file
  attr_reader :highest_count_across_lines #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  attr_reader :highest_count_words_across_lines #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute
  #  equal to the highest_count_across_lines determined previously.

  def initialize(file_name = File.join("data", "module2_content.txt"))
    @analyzers = []
    analyze_file(file_name)
    # call the calculate method(s) here
    calculate_line_with_highest_frequency
    print_highest_word_frequency_across_lines()  
    
  end

  # Implement the following methods in the Solution class.
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines
  #* Create an array of LineAnalyzers for each line in the file
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.

  def analyze_file (file_name)
    # this will get an instance of LineAnalyzer for each line of your data file into an array
    File.foreach(file_name).with_index do |line, line_number|
      # << is a common shorthand to append an item to an array
      
      @analyzers << LineAnalyzer.new(line, line_number + 1)
       a = @analyzers.to_a
      # puts a[1]
    end
  end

  # I'm gonna leave you to work out the calculate method(s), let me know if you get stuck


  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and
  #  highest_count_words_across_lines attribute values

  def calculate_line_with_highest_frequency
    
    # I need to send each line of the @analyzers to the 
    # the LineAnalyzer.calculate_word_frequency will find the words that appear the most on each line
    # I then need to identify  the LineAnalyzer objects in the @analyers array that have highest_wf_count equal to highest_count_accross 
    # * lines 
    # not sure if the next code is headed in the right direction
    #@analyers.foreach.with_index do |line, line_number| {self.initialize(line, line_number)}   # not sure how to send this to the Line Analyzer class
     # highest_count_across_lines << @highest_wf_words                        
    
    #end
  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in
  #  highest_count_words_across_lines in the specified format

  def print_highest_word_frequency_across_lines
    #puts highest_count_words_across_lines
    puts "Hello"
    
  end
end

 

Solution.new
