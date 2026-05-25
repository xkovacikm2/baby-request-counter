require "application_system_test_case"

class CountersTest < ApplicationSystemTestCase
  setup do
    Counter.destroy_all
    Counter.create!(plus: 0, minus: 0)
  end

  test "visiting the main page" do
    visit root_url
    assert_selector "h1", text: "Baby Počítadlo"
  end

  test "incrementing plus" do
    visit root_url
    click_on "+"
    assert_selector "h1", text: "Baby Počítadlo"
    assert_equal 1, Counter.first.plus
  end

  test "incrementing minus" do
    visit root_url
    click_on "−"
    assert_selector "h1", text: "Baby Počítadlo"
    assert_equal 1, Counter.first.minus
  end

  test "chart is always visible" do
    visit root_url
    assert_selector "h2", text: "Výsledky"
  end
end
