require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'

class BinaryTranslatorTest < Minitest::Test

  def test_it_exists
    bt = BinaryTranslator.new

    assert_instance_of BinaryTranslator, bt
  end

  def test_it_can_translate_one_letter
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
  end

  def test_it_can_translate_a_word
    bt = BinaryTranslator.new

    expected = "010100010101010010001001001110000111"
    assert_equal expected, bt.translate("turing")
  end

  def test_it_can_translate_uppercase_or_lowercase
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "000001", bt.translate("A")
    expected = "010100010101010010001001001110000111"
    assert_equal expected, bt.translate("turing")
    assert_equal expected, bt.translate("TURING")
  end

  def test_it_translate_a_space
    bt = BinaryTranslator.new

    assert_equal "000000", bt.translate(" ")
  end

end



# bt.translate("!@{$#%^&*()}")
# => ""
# bt.translate("Hello World!")
# => "001000000101001100001100001111000000010111001111010010001100000100"
