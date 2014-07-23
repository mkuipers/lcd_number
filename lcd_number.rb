class LcdNumber
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def self.from_int(int)
    if int > 10
      ints = int.to_s.chars
      from_int(ints.shift.to_i).append!(from_int(ints.join.to_i))
    elsif int >= 0
      numbers[int]
    else
      raise "Negative numbers not supported"
    end
  end

  def self.numbers
    [zero, one, two, three, four, five, six, seven, eight, nine]
  end

  def self.zero
    new([
      [false, true,  false,],
      [true,  false, true, ],
      [true, true,  true,]
      ])
  end

  def self.one
    new([
      [false, false, false,],
      [false, false, true, ],
      [false, false, true, ]
      ])
  end

  def self.two
    new([
      [false, true, false,],
      [false, true, true, ],
      [true,  true, false,]
      ])
  end

  def self.three
    new([
      [false, true, false,],
      [false, true, true,],
      [false, true, true,]
      ])
  end

  def self.four
    new([
      [false, false, false,],
      [true, true, true,],
      [false, false, true]
      ])
  end

  def self.five
    new([
      [false, true, false],
      [true, true, false],
      [false, true, true]
      ])
  end

  def self.six
    new([
      [false, true, false],
      [true, true, false],
      [true, true, true]
      ])
  end

  def self.seven
    new([
      [false, true, false],
      [true, false, true],
      [false, false, true]
      ])
  end

  def self.eight
    new([
      [false, true, false],
      [true, true, true],
      [true, true, true],
      ])
  end

  def self.nine
    new([
      [false, true, false],
      [true, true, true],
      [false, true, true],
      ])
  end

  def to_display_string
    cells.map { |l| line_string(l) }.join("\n")
  end

  def append!(lcd_number)
    @cells[0] += lcd_number.cells[0]
    @cells[1] += lcd_number.cells[1]
    @cells[2] += lcd_number.cells[2]
    return self
  end

  private
  def line_string(line)
    rval = ""
    line.each_with_index do |c, i|
      #if it's the middle element in its triplet, it's horizontal predicate
      if i%3 == 1
        rval += horizontal(c)
      else
        rval += vertical(c)
      end
    end
    rval
  end

  def horizontal(val)
    val ? "_" : " "
  end
  def vertical(val)
    val ? "|" : " "
  end

end