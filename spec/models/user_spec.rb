# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  # it { is_expected.to validate_presence_of :name }
  # it { is_expected.to validate_presence_of :phone }
  # it { is_expected.to validate_presence_of :address }
end

describe 'Sign in with Mailru' do
  before do
    OmniAuth.config.add_mock(:mail_ru, { uid: 'test@mail.ru' })
  end

  let(:user)    { create(:user) }
  let(:company) { create(:company) }

  it 'with valid email and password' do
    visit '/'
    expect(page).not_to have_content 'Sign Out'
    click_link 'nav-sign-in' # image/button: Sign in with LinkedIn
    expect(page).to have_content 'Sign Out'
  end
end
