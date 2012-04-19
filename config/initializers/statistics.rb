# A collection of class methods for determining the sample mean.
#
# Author:: Kevin Ng Shi Wei  
class Mean
  # Returns the mean of parameter "sample" - an array of numbers.
  #
  # Usage:
  #
  #   sample = [2, 3, 4, 5, 6, 7, 8, 9]
  #   puts Mean.of(sample)
  #
  # Output:
  #
  #   5.5
  def self.of(sample)
    sum = 0
    sample.each { |value| sum += value }
    sum.to_f/sample.size
  end
  
  # Returns the weighted mean of parameter "sample" - an array of numbers, 
  # given the set of corresponding weights (parameter "weights" - an array of
  # numbers). The size of the "sample" and "weights" array must be equal.
  # 
  # The formula for the weighted mean is sum(w*x)/sum(w)
  #
  # Example:
  # 
  # Cod, flounder, haddock, and ocean perch brought fisherman 33.0, 57.9, 39.4, 
  # and 28.3 cents per pound. Given that 100 million pounds of cod, 201 million 
  # pounds of flounder, 55 million pounds of haddock, and 19 million pounds of 
  # ocean perch was caught, what is the overall price they received per pound?
  # 
  # Solution:
  # 
  # Overall price per pound = ((100 * 33.0) + (201 * 57.9) + (55 * 39.4) + (19 * 28.3)) / (100 + 201 + 55 + 19)
  #
  # Usage:
  #
  #   sample = [33.0, 57.9, 39.4, 28.3]
  #   weights = [100, 201, 55, 19]
  #   puts Mean.weighted(sample, weights)
  #
  # Output:
  #
  #   47.0469333333333
  def self.weighted(sample, weights)
    raise ArgumentError, 'Sample size is not equals to the number of weights supplied.' if sample.size != weights.size
    sum = 0
    weights_sum = 0
    i = 0
    while (i < sample.size)
      sum += sample[i] * weights[i]
      weights_sum += weights[i]
      i += 1
    end
    sum.to_f/weights_sum.to_f
  end
end

# A collection of class methods for determining the sample median.
#
# Author:: Kevin Ng Shi Wei
class Median
  # Returns the median of the parameter "sample" - an array of numbers.
  #
  # The median of n values, where the data is arranged according to size is:
  # * the value in the middle, when n is odd
  # * the mean of the 2 values nearest to the middle, when n is even
  #
  # Example/Solution:
  #
  # The median of sample - 31, 36, 53, 53, 67 - is 53.
  #
  # The median of sample - 3, 7, 8, 11, 12, 13, 15, 16, 18, 21 - is (12 + 13) / 2 = 12.5
  #
  # Usage:
  #
  #   sample = [31, 36, 53, 53, 67]
  #   puts Median.of(sample)
  #   sample = [3, 7, 8, 11, 12, 13, 15, 16, 18, 21]
  #   puts Median.of(sample)
  #
  # Output:
  #
  #   53
  #   12.5
  def self.of(sample)
    raise ArgumentError, 'Sample size must be greater than 0.' if sample.size < 1
    median = 0
    # If the sample size is an even number, there will be the average of the 2 center values.
    if sample.size % 2 == 0
      second_index = sample.size / 2
      first_index = second_index - 1
      median = (sample[first_index] + sample[second_index]).to_f / 2
    else # If the sample size is an odd number, the median is simply the center value.
      median = sample[(sample.size - 1) / 2]
    end
    median
  end
end

# A collection of class methods for determining the sample mode.
#
# Author:: Kevin Ng Shi Wei
class Mode
  
  # Returns a Hash containing the item with the highest count, or multiple items if there is a tie. 
  # The key is the name of the item while the value is the count.
  #
  # Usage:
  #   p Mode.of([2, 2, 3, 3, 3, 4, 4, 4, 5])
  #
  # Output:
  #   {3=>3, 4=>3} # "3" and "4" tie for the highest count in the sample - 3.
  def self.of(sample)
    counts = Mode.count(sample)
    values = counts.values
    highest_value = values[0]
    values.each { |value| highest_value = value if value > highest_value } # find the highest count value
    modes = Hash.new
    counts.each { |key, value| modes[key] = value if value == highest_value } # populate the Hash with the sample modes
    modes
  end
  
  # Counts the number of occurrence of each value in parameter "sample" - an array of numbers - and
  # returns a Hash containing key-value pairs where keys are unique representations of the values in
  # "sample", and the corresponding value the number of occurrence of the "sample" value.
  #
  # Usage:
  #   p Mode.count([2, 2, 3, 3, 3, 4, 4, 4, 5])
  #
  # Output:
  #   {5=>1, 2=>2, 3=>3, 4=>3} # there are 1 "5", 2 "2"s, 3 "3"s and 3 "4"s.
  def self.count(sample)
    count = Hash.new
    sample.each { |value| count[value] = count.has_key?(value) ? count[value] + 1 : 1 }
    count
  end
end

# Collection of class methods for determining the sample range
#
# Author:: Kevin Ng Shi Wei
class Range
  # Returns the difference between highest and lowest value in the parameter "sample" - an array of numbers.
  #
  # Example:
  #
  # The range of the sample - 2, 4, 5, 6, 7, 10, 23, 4 - is 23 - 2 = 21.
  #
  # Usage:
  #
  #   puts Range.of([2, 4, 5, 6, 7, 10, 23, 4])
  #
  # Output:
  #
  #   21
  def self.of(sample)
    largest = sample[0]
    smallest = sample[0]
    sample.each { |value| 
      largest = value if value > largest 
      smallest = value if value < smallest }
    largest - smallest
  end
end

#require 'variance'

# Collection of class methods for determining the sample standard deviation.
#
# Author:: Kevin Ng Shi Wei
class StdDev
  # Returns the sample standard deviation of the parameter "sample" - an array of numbers.
  # Note: for population standard deviation - use StdDev.pop(population)
  #
  # Usage:
  #
  #   puts StdDev.of([3, 4, 5, 6, 7, 8, 9, 10])
  #
  # Output:
  #
  #   2.44948974278318
  def self.of(sample)
    Math.sqrt(Variance.of(sample))
  end
  
  # Returns the population standard deviation of the parameter "population" - an array of numbers.
  # Note: for sample standard deviation - use StdDev.of(population)
  #
  # Usage:
  #
  #   puts StdDev.of([3, 4, 5, 6, 7, 8, 9, 10])
  #
  # Output:
  #
  #   2.29128784747792
  def self.pop(population)
    Math.sqrt(Variance.pop(population))
  end
end

#require 'mean'

# Collection of class methods for determining the sample variance.
#
# Author:: Kevin Ng Shi Wei
class Variance
  # Returns the sample variance of the parameter "sample" - an array of numbers. 
  # Note: for population variance - use Variance.pop(population).
  #
  # Usage:
  #
  #   puts Variance.of([3, 4, 5, 6, 7, 8, 9, 10])
  #
  # Output:
  #
  #   6.0
  def self.of(sample)
    dev_sum(sample).to_f / (sample.size - 1)
  end
  
  # Returns the population variance of the parameter "population" - an array of numbers. 
  # Note: for sample variance - use Variance.of(sample).
  #
  # Usage:
  #
  #   puts Variance.pop([3, 4, 5, 6, 7, 8, 9, 10])
  #
  # Output:
  #
  #   5.25
  def self.pop(population)
    dev_sum(population).to_f / population.size
  end
  
  private
  
  # Returns the sum of the deviation of each value in the sample from the sample mean.
  def self.dev_sum(sample)
    mean = Mean.of(sample)
    deviation = 0
    sample.each { |value| deviation += (value - mean) ** 2 }
    deviation
  end
end