class HexToBase64
  require 'pry'

  def initialize(hex)
    @hex = hex
  end

  def hex_to_decimal
    hex_array = @hex.downcase.split('')
    @decimal, position = 0, (hex_array.length - 1)
    hex_chars = (0..9).to_a.collect! {|num| num.to_s} + 'a'.upto('f').to_a
    hex_array.collect! do |val|
      val = (hex_chars.index(val)) * ( 16 ** position )
      @decimal += val
      position -= 1
    end
    return @decimal
  end

  def decimal_to_base(decimal, base)
    n = base
    @results = []
    while n >= 0
      base_value = base**n
      if decimal/base_value != 0
        result = (decimal/base_value).to_i
        remainder = (decimal % base_value).to_i
        @results << result
        n -= 1
        decimal = remainder
      elsif 
        n -= 1
      end
    end
    return @results
    binding.pry
  end

  def base_64_encode(array)
    base_64_chars = 'A'.upto('Z').to_a + 'a'.upto('z').to_a + (0..9).to_a + ["+", "/"]
    encoded_array = []
    array.each { |val| encoded_array << base_64_chars[val] }
    final = encoded_array.join('')
    puts final
    final != 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t' ? (puts "IT'S WRONG") : (puts "IT'S RIGHT")
    return final
  end

  def full_decrypt
    sleep 1
    puts "calculating base 10..."
    hex_to_decimal
    sleep 1
    puts "calculating base 64..."
    decimal_to_base(@decimal, 64)
    base_64_encode(@results)
  end

end


conversion = HexToBase64.new('49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d')
conversion.full_decrypt

# ('2AF3')
# ('40FBDFBFCC227A9538')

