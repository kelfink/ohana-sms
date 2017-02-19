# frozen_string_literal: true
 require 'minitest/mock'
require 'test_helper'

class MessengerTest < MiniTest::Unit::TestCase
  def setup
    session = {zip: 95814}
    @messenger = Messenger.new(session)
  end

  def test_phone_finds_first
    @messenger.stub :locations, [Location.new([Phone.new(1234567)])] do
      assert_equal(@messenger.phone, "Phone: 1234567")
    end
  end

  def test_phone_finds_default
    @messenger.stub :locations, [Location.new([])] do
      assert_equal(@messenger.phone, "Phone: ")
    end
  end
  class Location

    def initialize(phone_list)
      @phones = phone_list
    end
    def phones
      @phones
    end
  end

  class Phone

    def initialize(phone_number)
      @number = phone_number
    end

    def number
      return @number
    end
  end
end
