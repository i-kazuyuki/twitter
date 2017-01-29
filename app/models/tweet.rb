class Tweet < ActiveRecord::Base
    validates :content, presence: true
    validates_length_of :content, maximum: 255
end
