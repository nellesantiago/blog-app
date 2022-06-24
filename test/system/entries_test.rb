require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:entry)
    @user = users(:user)
    sign_in @user
    visit entries_url
  end

  test "visiting the index" do
    assert_text "Title"
  end

  test "creating an entry" do
    click_on(class: "add")

    fill_in "entry[title]", with: "Subject"
    fill_in "entry[content]", with: "New Content"
    click_on "Create Entry"

    assert_text "Subject"
  end

  test "view an entry" do
    click_on(class: "book")

    assert_text "Edit"
  end

  test "updating an entry" do
    click_on(class: "pen")

    fill_in "entry[content]", with: @entry.content
    fill_in "entry[title]", with: @entry.title
    click_on "Update Entry"

    assert_text "Title"
  end

  test "deleting an entry" do
    page.accept_confirm do
      click_on(class: "trash")
    end

    assert_text "+ Add New"
  end
end
