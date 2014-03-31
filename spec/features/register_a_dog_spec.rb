require 'spec_helper'

feature 'register a dog', %Q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers
} do

# Acceptance Criteria:

# * An owner must specify their first name, last name, email address, and dog's name.
# * Upon adding my entry, I can see a list of other registered dog owners.
# * An owner's full_name can be requested. Hint: This will require an instance method

  scenario 'create a valid dog registration' do
    prev_count = RegisterDog.count
    visit '/register_dogs/new'

    fill_in 'First Name',
      with: 'Lydia'
    fill_in 'Last Name',
      with: 'Ho'
    fill_in 'Email',
      with: 'lho@doglover.com'
    fill_in 'Dog Name',
      with: 'Shuko'

    click_button 'Register Dog'
    expect(page).to have_content('Dog registered.')
    expect(RegisterDog.count).to eq(prev_count + 1)
    expect(page).to have_content('Lydia Ho')

  end

  scenario 'create an invalid dog registration' do
    prev_count = RegisterDog.count
    visit '/register_dogs/new'
    click_button 'Register Dog'
    expect(page).to have_content('can\'t be blank')
    expect(RegisterDog.count).to eql(prev_count)
  end
end
