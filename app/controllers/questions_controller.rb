class QuestionsController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :new, :index]
    
    def question_params
        params.require(:question).permit(:category, :question, :option1, :option2, :option3, :option4, :option5, :answer,:image1,:image2,:image3,:image4,:image5,:imagequestion)
    end
    
    def index
        @questions = QuestionBank.all
    end
    
    def create
         @question = QuestionBank.create!(question_params)

        if params[:imagequestion].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:imagequestion])
            @question.update(question: preloaded.identifier)
        end
        if params[:image1].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image1])
            @question.update(option1: preloaded.identifier)
        end
        if params[:image2].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image2])
            @question.update(option2: preloaded.identifier)
        end
        if params[:image3].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image3])
            @question.update(option3: preloaded.identifier)
        end
        if params[:image4].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image4])
            @question.update(option4: preloaded.identifier)
        end
        if params[:image5].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image5])
            @question.update(option5: preloaded.identifier)
        end
       
        flash[:success] = "Question was successfully added"
        redirect_to questions_path
    end
    
    def edit
        @question = QuestionBank.find(params[:id])
       # redirect_to questions_path(@question)
    end
    
    def update

        @question = QuestionBank.find(params[:id])
        @question.update_attributes!(question_params)
        if params[:imagequestion].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:imagequestion])
            @question.update(question: preloaded.identifier)
        end
        if params[:image1].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image1])
            @question.update(option1: preloaded.identifier)
        end
        if params[:image2].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image2])
            @question.update(option2: preloaded.identifier)
        end
        if params[:image3].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image3])
            @question.update(option3: preloaded.identifier)
        end
        if params[:image4].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image4])
            @question.update(option4: preloaded.identifier)
        end
        if params[:image5].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image5])
            @question.update(option5: preloaded.identifier)
        end
        flash[:success] = "Question-#{@question.id} was successfully updated."
        redirect_to questions_path(@question)
    end
    
    def destroy
        @question = QuestionBank.find(params[:id])
        @question.destroy
        flash[:destroy] = "Question-'#{@question.id}' deleted."
        redirect_to questions_path
    end
    
    private
    
        # Confirms a logged-in user.
        def logged_in_user
          unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
          end
        end
end
