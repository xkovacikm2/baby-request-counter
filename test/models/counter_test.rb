require "test_helper"

class CounterTest < ActiveSupport::TestCase
  setup do
    Counter.destroy_all
  end

  test "instance creates a counter if none exists" do
    assert_difference "Counter.count", 1 do
      Counter.instance
    end
  end

  test "instance returns existing counter" do
    counter = Counter.create!
    assert_equal counter, Counter.instance
  end

  test "saldo returns plus minus minus" do
    counter = Counter.create!(plus: 5, minus: 3)
    assert_equal 2, counter.saldo
  end

  test "defaults to zero" do
    counter = Counter.create!
    assert_equal 0, counter.plus
    assert_equal 0, counter.minus
  end
end
