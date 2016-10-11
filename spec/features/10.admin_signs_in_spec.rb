feature 'Admin signs into website' do
  context 'As an Admin' do
    before do
      admin = User.create(name: 'admin', email: 'specialemail@company.com', password: 'supersecret', role: 'admin' )
      login_as(admin, scope: :user, run_callbacks: false)
    end

    scenario 'I can sign in and see a special message on the homepage' do
      devtool = FactoryGirl.create(:devtool)
      visit root_path
      expect(page).to have_content( %{
        Welcome Super Elite Group 8 member,
        you are a member of an exclusive, Clandestine,
        and Dope AF club.} )
        expect(page).to have_content("#{devtool.title} delete")
    end
    scenario 'I can delete an item from the index page' do
      tool = FactoryGirl.create(:devtool)
      visit root_path
      click_link 'delete'
      expect(page).to_not have_content(tool.title)
    end
    scenario 'I can visit a Dev Tools page and delete it' do
      tool = FactoryGirl.create(:devtool)
      visit devtool_path(tool)
      click_link 'delete'
      expect(page).to have_content('Dev Tool Successfully Deleted!')
    end
    scenario 'I can delete reviews from a Dev Tools page' do
      tool = FactoryGirl.create(:devtool)
      review = FactoryGirl.create(:review, devtool: tool)
      visit devtool_path(tool)
      click_link "delete #{review.title}"
      expect(page).to have_content('Review Successfully Deleted!')
      expect(page).to_not have_content(review.title)
    end
    scenario 'I can visit a list of users' do
      users = FactoryGirl.create_list(:user, 5)
      visit users_path
      users.each do |user|
        expect(page).to have_content(user.name)
      end
      expect(page).to have_content('delete')
    end
    scenario 'I can delete a user from the list' do
      user = FactoryGirl.create(:user)
      visit users_path
      click_link "delete #{user.name}"
      expect(page).to_not have_content(user.name)
      expect(page).to have_content("User deleted, we didn't like them anyway.")
    end
  end

  context 'As a User' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user, run_callbacks: false)
    scenario 'I cannot see special messages or delete links on the homepage' do
      visit root_path
      expect(page).to_not have_content('delete')
    end
    scenario 'I cannot see special delete messages on a devtools review page' do
      tool = FactoryGirl.create(:devtool)
      visit devtool_path(tool)
      expect(page).to_not have_content('delete')
    end
  end
end
