# require 'test/unit'
# require 'stringio'

class Triangle
  @@num_list
  @@test = 0

  def input
    @@num_list = $stdin.readlines.map(&:chomp).map(&:to_f)
  end
  
  def input_list_size
    @@num_list.count
  end

  def all_calc
    @@num_list.each{ |num|
      calc(num)
      @@test += 1
    }
    @@test
  end

  def calc(rad)
    p (Math::PI * rad * rad).round
  end
end

class TestStack < Test::Unit::TestCase
  def setup
    @obj = Triangle.new
  end

  def test_input_integer
    $stdin = StringIO.new("123\n")
    assert_equal 123, @obj.input[0]
    $stdin = STDIN
  end

  def test_input_string
    $stdin = StringIO.new("abc\n")
    assert_equal 0, @obj.input[0]
    $stdin = STDIN
  end

  def test_input_list_size
    $stdin = StringIO.new("123\n456\n789\n")
    @obj.input
    assert_equal 3, @obj.input_list_size
    $stdin = STDIN
  end

  def test_input_float
    $stdin = StringIO.new("123.1\n456.2\n789.3\n")
    @obj.input
    assert_equal 3, @obj.input_list_size
    $stdin = STDIN
  end

  def test_calc
    assert_equal 314, @obj.calc(10)
  end

  def test_all_calc
    $stdin = StringIO.new("123.1\n456.2\n789.3\n")
    # $stdout = StringIO.new
    @obj.input
    assert_equal 3, @obj.all_calc
    # $stdout = STDOUT
    $stdin = STDIN
  end
end

tri = Triangle.new
tri.input
tri.all_calc
