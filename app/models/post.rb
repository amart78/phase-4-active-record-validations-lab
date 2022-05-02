class Post < ApplicationRecord
#1. All posts have a title
    validates :title, presence: true

#2.  Post content is at least 250 characters long
    validates :content, length: {minimum: 250}

#3. Post summary is a maximum of 250 characters
    validates :summary, length: {maximum: 250}

#4. Post category is either Fiction or Non-Fiction.  This step requires an inclusion validator, 
#   which was not outlined in the lesson. You'll need to refer to the Rails guide to look up how to use it.
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

#5. Add a custom validator to the Post model that ensures the title is sufficiently clickbait-y. 
#   The validator should add a validation error if the title does not contain:
    #   "Won't Believe",  "Secret", "Top [number]", "Guess"
    validate :clickbait?

    CLICKBAIT_PATTERNS = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, 'must be clickbait')
      end
    end
#   Ruby regular expressions are defined between two forward slashes to differentiate them from other language syntax.
#   adding i makes ruby regex case insensitive
#   \d is shorthand for [0-9]

end
