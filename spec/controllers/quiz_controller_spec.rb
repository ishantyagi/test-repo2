require 'rails_helper'

RSpec.describe QuizController, type: :controller do
    
 #index
  describe 'Index questions for Quiz' do
    let!(:question1) { FactoryBot.create(:question_bank, question: 'Test Question1', category: 'cat1', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '2')}
    let!(:question2) { FactoryBot.create(:question_bank, question: 'Test Question2', category: 'cat2', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '3')}
    let(:params) { {quizlimit: "All"} }
    it 'gets all questions' do
      get :index, quizlimit: "All"
      expect(assigns(:questions)).to include(question1,question2)
    end
    let(:params) { {quizlimit: 1} }
    it 'gets only given number of questions' do
        get :index, quizlimit: 1
        expect(assigns(:questions).count).to eq(1)
    end
  end

end
