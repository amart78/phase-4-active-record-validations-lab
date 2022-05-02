class Author < ApplicationRecord

#1. All authors have a name
    validates :name, presence: true

#2. No two authors have the same name
    validates :name, uniqueness: true
#3. Author phone numbers are exactly ten digits
    validates :phone_number,length: {is: 10}
end
