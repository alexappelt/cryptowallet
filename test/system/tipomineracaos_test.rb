require "application_system_test_case"

class TipomineracaosTest < ApplicationSystemTestCase
  setup do
    @tipomineracao = tipomineracaos(:one)
  end

  test "visiting the index" do
    visit tipomineracaos_url
    assert_selector "h1", text: "Tipomineracaos"
  end

  test "creating a Tipomineracao" do
    visit tipomineracaos_url
    click_on "New Tipomineracao"

    fill_in "Descricao", with: @tipomineracao.descricao
    fill_in "Sigla", with: @tipomineracao.sigla
    click_on "Create Tipomineracao"

    assert_text "Tipomineracao was successfully created"
    click_on "Back"
  end

  test "updating a Tipomineracao" do
    visit tipomineracaos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @tipomineracao.descricao
    fill_in "Sigla", with: @tipomineracao.sigla
    click_on "Update Tipomineracao"

    assert_text "Tipomineracao was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipomineracao" do
    visit tipomineracaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipomineracao was successfully destroyed"
  end
end
