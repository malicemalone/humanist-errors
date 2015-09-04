require_relative '../test_helper'

class RegexHashTest < Minitest::Test

  def test_a_regex_search_happens_on_key_send
    magic_string_hash = HumanistErrors::RegexHash[/findme/ => "hurray!"]
    assert_match(magic_string_hash['findme'], "hurray!")
  end

  def test_a_failure_when_key_is_not_found
    magic_string_hash = HumanistErrors::RegexHash[/findme/ => "hurray!"]
    error = assert_raises(NoMethodError) { magic_string_hash['1'] }
    assert error.message.include? "Could not find Ruby message in dictionary: 1" 
  end
end