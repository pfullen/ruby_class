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
    self.content = content  
    self.line_number = line_number
    highest_wf_count
    calculate_word_frequency()
  end
  
  #* calculate_word_frequency() - calculates result
  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
  def self.calculate_word_frequency(content)
    hash = content.each_with_object(Hash.new(0)) {|word,count| count[word] +=1}
    puts hash
    puts highest_wf_count = hash.values.max
    #puts hash(value(highest_wf_count))
    
    

    puts hash2 = hash.reject {|k,v| v != highest_wf_count}  

    highest_wf_words = hash2.keys
    print highest_wf_words
    #puts hash.each |key, value|  value == highest_wf_count|

    #highest_wf_words = hash.key(highest_wf_count)
    #puts hash.key {|key| value == highest_wf_counthash = content.each_with_object(Hash.new(0)) {|word,highest_wf_count| highest_wf_count[word] +=1}}
    #hash2 = content.each_with_object(Hash.new(0)) {|word,chighest_wf_count| highest_wf_count[word] +=1}

  end

  

  
end

#content = %w(How much wood can a wood could a wood chuck zebra chuck chuck if a wood chuck could chuck wood)
 #LineAnalyzer.calculate_word_frequency(content)


#  Implement a class called Solution. 
#class Solution
class Solution
  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers  #* analyzers - an array of LineAnalyzer objects for each line in the file
  attr_reader :highest_count_across_lines #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  attr_reader :highest_count_words_across_lines #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.

  def self.analyze_file ()
    f = File.new("test.txt")
    #f.readlines(file).each do |line|
     line = f.readlines[1]   # using line two just to test
     puts line
     LineAnalyzer.initialize(line, '2')
     
     #puts analyzers = LineAnalyzer.initialize(content, line_number)
    
    #puts analyzers
    #end
  end

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values

  def calculate_line_with_highest_frequency  
    
  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format

  def print_highest_word_frequency_across_lines 
    puts highest_count_words_across_lines
  end
  
  


  
end

Solution.analyze_file()