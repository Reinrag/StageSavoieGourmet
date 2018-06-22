require 'test_helper'

class ArticleSoumisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article_soumi = article_soumis(:one)
  end

  test "should get index" do
    get article_soumis_url
    assert_response :success
  end

  test "should get new" do
    get new_article_soumi_url
    assert_response :success
  end

  test "should create article_soumi" do
    assert_difference('ArticleSoumi.count') do
      post article_soumis_url, params: { article_soumi: { content: @article_soumi.content, title: @article_soumi.title } }
    end

    assert_redirected_to article_soumi_url(ArticleSoumi.last)
  end

  test "should show article_soumi" do
    get article_soumi_url(@article_soumi)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_soumi_url(@article_soumi)
    assert_response :success
  end

  test "should update article_soumi" do
    patch article_soumi_url(@article_soumi), params: { article_soumi: { content: @article_soumi.content, title: @article_soumi.title } }
    assert_redirected_to article_soumi_url(@article_soumi)
  end

  test "should destroy article_soumi" do
    assert_difference('ArticleSoumi.count', -1) do
      delete article_soumi_url(@article_soumi)
    end

    assert_redirected_to article_soumis_url
  end
end
