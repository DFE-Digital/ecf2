require 'rails_helper'

describe 'autocomplete', driver: :null do
  let(:page) { @playwright_page }

  it 'can list and select options based on first characters typed' do
    page.goto("/countries")

    # Expect list of options to be hidden
    expect(page.locator('#my-autocomplete__listbox')).not_to be_visible

    # Type first chars into the autocomplete field
    page.wait_for_selector('input#my-autocomplete').type('un')

    # Expect list of options to be visible
    expect(page.locator('#my-autocomplete__listbox')).to be_visible

    #page.keyboard.press('Enter')
    # expect(page.text_content('#content')).to include('hoge')
  end
end
