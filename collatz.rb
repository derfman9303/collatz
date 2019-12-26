class Collatz
  def initialize
    @length = 0
    @cache = {}
  end

# sequence method simply completes each collatz sequence from 1 to 1000000.
  def sequence(n)
    if n == 1
      return @length
    elsif n.even?
      n = n / 2
    else
      n = n * 3 + 1
    end
    @length = @length + 1
    sequence(n)
  end

# sequence_cache will save the collatz sequence length of numbers into a hash, reducing execution time.
  def sequence_cache(n)
    if n == 1
      return @length
    elsif @cache[n] != nil
      @length = @length + @cache[n]
      return @length
    elsif n.even?
      n = n / 2
    else
      n = n * 3 + 1
    end
    @length = @length + 1
    sequence_cache(n)
  end

  def test
    @iteration = 1
    longest_sequence_length = @length
    1000000.times do
      @length = 0
      # to execute using the simple sequence method, change the following line to call sequencce method.
      sequence_cache(@iteration)
      if longest_sequence_length < @length
        longest_sequence_length = @length
        puts longest_sequence_length
        @longest = @iteration
      end
      @cache[@iteration] = @length
      @iteration = @iteration + 1
    end
    puts "From 1 to " + (@iteration - 1).to_s
    return "longest sequence was " + (longest_sequence_length).to_s + " steps long, starting with " + @longest.to_s + "."
  end
end

collatz = Collatz.new

puts collatz.test
