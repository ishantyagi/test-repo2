require 'rails_helper'

RSpec.describe SelquizController, type: :controller do
    describe 'Index Function' do
        it 'should get all the categories' do
            get :index
            expect(assigns(:quizlimit)).to eq(["20","40","60","All"])
        end
    end
end