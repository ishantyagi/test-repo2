class QuizController < ApplicationController
    
    def index
        if params[:quizlimit] == "All"
         @questions= QuestionBank.all
        
        else
            @questions= QuestionBank.all.sample(params[:quizlimit].to_i)
        end
    end
end
