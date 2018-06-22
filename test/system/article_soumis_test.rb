require "application_system_test_case"

class ArticleSoumisTest < ApplicationSystemTestCase
  setup do
    @article_soumi = article_soumis(:one)
  end

  test "visiting the index" do
    visit article_soumis_url
    assert_selector "h1", text: "Article Soumis"
  end

  test "creating a Article soumi" do
    visit article_soumis_url
    click_on "New Article Soumi"

    fill_in "Content", with: @article_soumi.content
    fill_in "Title", with: @article_soumi.title
    click_on "Create Article soumi"

    assert_text "Article soumi was successfully created"
    click_on "Back"
  end

  test "updating a Article soumi" do
    visit article_soumis_url
    click_on "Edit", match: :first

    fill_in "Content", with: @article_soumi.content
    fill_in "Title", with: @article_soumi.title
    click_on "Update Article soumi"

    assert_text "Article soumi was successfully updated"
    click_on "Back"
  end

  test "destroying a Article soumi" do
    visit article_soumis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article soumi was successfully destroyed"
  end
end
