describe 'autocomplete 1 JS', :js do
  let(:page) { RSpec.configuration.playwright_page }

  it 'can use Playwright with JavaScript enabled to test a feature' do
    page.goto("/countries")

    # Expect list of options to be hidden
    expect(page.locator('#my-autocomplete__listbox')).not_to be_visible

    # Type first chars into the autocomplete field
    autocomplete = page.wait_for_selector('input#my-autocomplete')
    autocomplete.type('un')

    # Expect list of options to be visible
    expect(page.locator('#my-autocomplete__listbox')).to be_visible

    7.times { page.keyboard.press('ArrowDown') }
    page.keyboard.press('Enter')

    expect(autocomplete.input_value).to eq("United Kingdom")

    page.get_by_role("button", name: 'Go to country').click
    expect(page.get_by_text("Welcome to United Kingdom")).to be_visible
    expect(page.url).to eq("#{RSpecPlaywright::RAILS_SERVER_URL}/countries/united-kingdom")
  end
end

describe 'autocomplete 2' do
  let(:page) { RSpec.configuration.playwright_page }

  it 'can use Playwright with JavaScript disabled to test a feature' do
    page.goto("/countries")

    expect(page.get_by_text("Select your country")).to be_visible
    expect(page.get_by_role("button", name: 'Go to country')).to be_visible
  end
end

describe 'autocomplete 3 JS', :js do
  let(:page) { RSpec.configuration.playwright_page }

  it 'can switch back to Playwright with JavaScript enabled to test another feature' do
    page.goto("/countries")

    # Expect list of options to be hidden
    expect(page.locator('#my-autocomplete__listbox')).not_to be_visible

    # Type first chars into the autocomplete field
    autocomplete = page.wait_for_selector('input#my-autocomplete')
    autocomplete.type('un')

    # Expect list of options to be visible
    expect(page.locator('#my-autocomplete__listbox')).to be_visible

    7.times { page.keyboard.press('ArrowDown') }
    page.keyboard.press('Enter')

    expect(autocomplete.input_value).to eq("United Kingdom")

    page.get_by_role("button", name: 'Go to country').click
    expect(page.get_by_text("Welcome to United Kingdom")).to be_visible
    expect(page.url).to eq("#{RSpecPlaywright::RAILS_SERVER_URL}/countries/united-kingdom")
  end
end

describe 'city form' do
  let(:page) { RSpec.configuration.playwright_page }

  it 'can switch back to Playwright with JavaScript disabled to test another feature' do
    page.goto("/cities")
    page.get_by_label('Name').fill('London')
    page.get_by_role("button", name: "Go to city").click

    expect(page.get_by_text("Welcome to London")).to be_visible
    expect(page.url).to eq("#{RSpecPlaywright::RAILS_SERVER_URL}/cities/london")
  end
end