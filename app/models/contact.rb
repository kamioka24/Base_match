class Contact < ApplicationRecord
	belongs_to :player

	validates :name, presence: true
	validates :year, presence: true
	validates :choice, presence: true
	validates :question, length: {maximum: 100}

	enum choice: {入団希望: 0, 体験希望: 1}
end
