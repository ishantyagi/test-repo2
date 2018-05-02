class SelquizController < ApplicationController
    
    def index
        @quizlimit=QuestionBank.quizLimit
    end
    
end
