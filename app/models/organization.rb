# An organization is a top level entity that wraps together clients & projects
class Organization < ApplicationRecord
  # http://guides.rubyonrails.org/association_basics.html
  has_many :projects, dependent: :destroy

  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :name, :key, presence: true

  validates :name, format: { with: %r{\A([a-zA-Z]|\s|\d)+\z},
                             message: 'only allows letters, numbers and spaces' }
end
