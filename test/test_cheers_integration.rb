require_relative 'helper'

class TestCheersIntegration < Minitest::Test

  def test_help_message
     
    output = `./cheers`
    expected = <<EOS
    I'd cheer for you, if only I knew who you were :(
    Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end
  
  
  #############################################
  #  1 arg only tests
  #############################################
  
  def test_only_name_argument
     
    output    = `./cheers Abby`
    expected  = <<EOS
      Give me an... A
      Give me a... B
      Give me a... B
      Give me a... Y
      Abby’s just GRAND!
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end
  
  def test_only_date_argument
     
    output    = `./cheers 45/25`
    expected  = <<EOS
      I'd cheer for you, if only I knew who you were :(
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output 
  end
  
  #-------------------------------#
  
  def test_non_word_argument
    output    = `./cheers @0!0`
    expected  = <<EOS
      I'd cheer for you, if only I knew who you were :(
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end
  
  def test_empty_string_argument
    output    = `./cheers ""`
    expected  = <<EOS
      I'd cheer for you, if only I knew who you were :(
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end 
   
#######################################################
#################### 2 Arguments ######################
#######################################################

  def test_two_valid_arguments
     
    output = `./cheers Abby 08/25`
    expected = <<EOS
    Give me an... A
    Give me a... B
    Give me a... B
    Give me a... Y
    Abby’s just GRAND!
    
    Awesome!  Your birthday is in 127 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end
  
  def test_one_valid_and_one_invalid_arguments
     
    output = `./cheers Abby 25/ 08`
    expected = <<EOS
    Give me an... A
    Give me a... B
    Give me a... B
    Give me a... Y
    Abby’s just GRAND! 
    I couldn't understand that. Could you give that to me in mm/dd format next time?     
EOS
    assert_equal expected, output
  end 
    
  def test_one_invalid_and_one_valid_arguments
     
    output   = `./cheers &&&& 09/25`
    expected = <<EOS
      I'd cheer for you, if only I knew who you were :(
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end
  
  def test_invalid_and_invalid_arguments
    output    = `./cheers $3#4 10/89`
    expected  = <<EOS
      I'd cheer for you, if only I knew who you were :(
      Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end
  
########################################################
#################### Valid Names #######################
########################################################
  
  
  def test_name_with_hyphens
    output    = `./cheers Abby-Abby`
    expected  = <<EOS
      Give me an... A
      Give me a... B
      Give me a... B
      Give me a... Y
      Give me an... A
      Give me a... B
      Give me a... B
      Give me a... Y
      Abby-Abby’s just GRAND!
EOS
    asseert_equal expected, output
  end
  
  def test_name_with_spaces
    output    = `./cheers Abby Abby`
    expected  = <<EOS
      Give me an... A
      Give me a... B
      Give me a... B
      Give me a... Y
      Give me an... A
      Give me a... B
      Give me a... B
      Give me a... Y
      Abby-Abby’s just GRAND!
EOS
    asseert_equal expected, output
  end

  # Scenarios discussed in class:
  # 0 args -> help message              <DONE!>
  # 1 valid arg                         <DONE!>
  # 1 invalid arg                       <DONE!>
  # 2 args                              <DONE!>
  #   * valid + valid                   <DONE!>
  #   * valid + invalid                 <DONE!>
  #   * invalid + valid                 <DONE!>
  #   * invalid + invalid               <DONE!>
  #
  # Valid Names:
  #    * Regular name                   <DONE!>
  #    * Name with hyphens              <DONE!>
  # Invalid Names:
  #   * birthday instead of name
  #   * all non-word characters
  #   * "" (empty string)
  #   * "  " (whitespace)
  # Valid Months:
  #   * m/dd (8/25)
  #   * mm/dd (08/25)
  #   * birthdays that already happened this year
  #   * birthdays that haven't happened yet this year
  # Invalid Months:
  #   * dd/mm (25/08)
  #   * dd/mm/yy (08/25/2015)
end