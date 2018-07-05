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

  def test_it_ignores_special_characters
    bt = BinaryTranslator.new

    assert_equal "", bt.translate("!@{$#%^&*()}")
    expected = "001000000101001100001100001111000000010111001111010010001100000100"
    assert_equal expected, bt.translate("Hello World!")
  end

  def test_it_can_translate_binary_to_text
    bt = BinaryTranslator.new

    binary = "001000000101001100001100001111000000010111001111010010001100000100"
    assert_equal "hello world", bt.translate_to_text(binary)
  end
end
