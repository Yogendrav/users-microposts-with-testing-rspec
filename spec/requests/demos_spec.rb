require 'spec_helper'

describe "Demo pages" do    #describing demo pages

  subject { page }          #subject eliminate the duplication of page

  describe "Index page" do
    before { visit root_path }     #inside the block code it will run before execute anything

    it { should have_selector('h1',    text: 'Sample App') }   #it will select the h1 heading and the test
    it { should have_selector('title', text: full_title('')) }  #it will check title
    it { should_not have_selector 'title', text: '| Index' }
  

  describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end
  describe "Hello page" do
    before { visit hello_path }

    it { should have_selector('h1',    text: 'Hello') }
    it { should have_selector('title', text: full_title('Hello')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end