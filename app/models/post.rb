class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    def clickbait?
    
    clickbait_array = ["Won't Believe", "Secret", "Top \\d+", "Guess"]
    
        if title.present? && clickbait_array.none?{|phrase| title.match?(phrase)}
            errors.add(:title, "must be clickbait")
            false
        else 
            true
        end
    end

end
