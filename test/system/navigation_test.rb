require_relative "application_system_test_case"

class NavigationTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit "/"
    assert_text "Owners"
  end
end
