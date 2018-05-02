require 'rails_helper'

RSpec.configure do |config|
    config.include SessionsHelper
end

RSpec.describe UsersController, type: :controller do

  describe "show function" do
    it "shows questions" do
      get :show
      expect(response).to redirect_to(questions_path)
    end
  end
  
  describe "Update User" do
    let!(:user1) { FactoryBot.create(:user, name: 'test1', email: 'test@testing.com', password: 'testing')}
    it " should not allow unless logged_in?" do
      put :update, {id: user1.id, user: { 'name' => 'test2'}}
      expect(flash[:danger]).to match(/Please log in/)
      expect(response).to redirect_to(login_url)
    end
    
    context 'logged_in session' do 
      let!(:user1) { FactoryBot.create(:user, name: 'test1', email: 'test@testing.com', password: 'testing')}
      it 'should allow updating the profile' do
        log_in user1
        put :update, {id: user1.id, user: { name: 'test2', email: 'test@testing.com', password: 'testing'}}
        expect(flash[:success]).to match(/Profile updated/)
        expect(response).to redirect_to(user1)
      end
      
      it 'should render edit when update_attributes does not work' do
        log_in user1
        put :update, {id: user1.id, user: { name: 'test2'}}
        expect(response).to render_template(:edit)
      end
    end
    
  end
  
  describe 'Index function' do
    let!(:question1) { FactoryBot.create(:question_bank, question: 'Test Question1', category: 'cat1', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '2')}
    let!(:question2) { FactoryBot.create(:question_bank, question: 'Test Question2', category: 'cat2', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '3')}
    #let(:params) { {} }
    it 'should list all the questions' do
      #get :index
      #expect(assigns(:questions)).to include(question1,question2)
    end
  end
  describe 'Edit function' do
    let!(:user1) { FactoryBot.create(:user, name: 'test1', email: 'test@testing.com', password: 'testing')}
    it 'allows modification to the user profile' do
      log_in user1
      get :edit, id: user1.id
      expect(response).to have_http_status(:success)
    end
  end
  
end
