require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/linktag'

class TestLinktag < Minitest::Test

  def setup
    options = {
      "url" => "http://google.co.uk",
      "name" => "Google",
      "genre" => "Search Engine",
      "description" => "Where to look for info"
    }
    @linktag = Linktag.new(options)
  end

  def test_url
    assert_equal("http://google.co.uk", @linktag.url)
  end

  def test_name
    assert_equal("Google", @linktag.name)
  end

  def test_genre
    assert_equal('Search Engine', @linktag.genre)
  end

  def test_description
    assert_equal("Where to look for info", @linktag.description)
  end

end