class Author < ApplicationRecord
    has_and_belongs_to_many :authors

    def name
        first_name + " " + last_name
    end

    validates :last_name, presence: true

    validates :first_name, presence: true
end
