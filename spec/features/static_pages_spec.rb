require 'rails_helper'

describe 'Home' do
  context 'HOME画面の表示は' do
    it 'it has a text Kenkou' do
      visit root_path
      expect(page).to have_css('h1', text: 'Kenkou')
    end
  end
  context 'aboutの場合は' do
    it 'it has a text About' do
      visit about_path
      expect(page).to have_css('h1', text: 'About')
    end
  end
  context 'contactの場合は' do
    it 'it has a text こんにちは' do
      visit contact_path
      expect(page).to have_css('h1', text: 'こんにちは')
    end
  end
end

describe 'Home' do
  context 'root_pathの場合' do
    it 'title is Kenkou Site' do
      visit root_path
      expect(page).to have_title 'Kenkou Site'
    end
  end
  context 'about_pathの場合' do
    it 'title is About | Kenkou Site' do
      visit about_path
      expect(page).to have_title 'About | Kenkou Site'
    end
  end
  context 'contact_pathの場合' do
    it  'title is Contact | Kenkou Site' do
      visit contact_path
      expect(page).to have_title 'Contact | Kenkou Site'
    end
  end
end

describe 'layout mix' do
  context 'Home画面にあるリンクたち' do
    before { visit root_path }
    it 'homepage has many links' do
      expect(page).to have_link nil, href: root_path, count: 2
      expect(page).to have_link 'About', href: about_path
      expect(page).to have_link 'Contact', href: contact_path
    end
  end
end