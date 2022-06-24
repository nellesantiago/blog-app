class Entry < ApplicationRecord
    belongs_to :user
    validates :title, presence: :true, format: {without: /\s/, message: "must contain no spaces"}
    validates :content, presence: :true
    validates_uniqueness_of :title, message: "already exists"
end
