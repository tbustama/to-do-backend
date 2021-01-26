class User < ApplicationRecord
    has_many :tasks
    has_many :notes
    validates_uniqueness_of :username 
end
