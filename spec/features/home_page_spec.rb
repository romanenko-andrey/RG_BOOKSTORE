describe "Bookstore App" do
  context "visit root" do
    before { visit '/' }
    
    it "displays Welcome invitation" do
      expect(page).to have_content 'Welcome to our amazing Bookstore!'
    end

    it "user is not logined now" do
      expect(page).to have_css("a", text: 'Log In')
    end
  end
  
end

