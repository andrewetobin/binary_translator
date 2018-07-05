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




end



# bt.translate("z")
# => "011010"
# bt.translate("turing")
# => "010100010101010010001001001110000111"
