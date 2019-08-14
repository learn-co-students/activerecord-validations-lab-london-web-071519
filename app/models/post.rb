class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :is_clickbait?

  
    CLICKBAIT_PATTERNS = 
    
      def is_clickbait?
        options = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
        if options.none? { |option| option.match title }
          errors.add(:title, "must be clickbait")
        end
      end

end

