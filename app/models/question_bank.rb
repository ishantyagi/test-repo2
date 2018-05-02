class QuestionBank < ActiveRecord::Base
    def self.category
        return ['Networks', 'Algorithms', 'Operating Systems', 'Software']
    end
    
    def self.quizLimit
    return ['20','40','60', 'All']
    end
    
end
