require 'test_helper'

class TipomineracaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipomineracao = tipomineracaos(:one)
  end

  test "should get index" do
    get tipomineracaos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipomineracao_url
    assert_response :success
  end

  test "should create tipomineracao" do
    assert_difference('Tipomineracao.count') do
      post tipomineracaos_url, params: { tipomineracao: { descricao: @tipomineracao.descricao, sigla: @tipomineracao.sigla } }
    end

    assert_redirected_to tipomineracao_url(Tipomineracao.last)
  end

  test "should show tipomineracao" do
    get tipomineracao_url(@tipomineracao)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipomineracao_url(@tipomineracao)
    assert_response :success
  end

  test "should update tipomineracao" do
    patch tipomineracao_url(@tipomineracao), params: { tipomineracao: { descricao: @tipomineracao.descricao, sigla: @tipomineracao.sigla } }
    assert_redirected_to tipomineracao_url(@tipomineracao)
  end

  test "should destroy tipomineracao" do
    assert_difference('Tipomineracao.count', -1) do
      delete tipomineracao_url(@tipomineracao)
    end

    assert_redirected_to tipomineracaos_url
  end
end
