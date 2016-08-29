# A client is a single entity that authenticates to a machine
class Client < ApplicationRecord
  # http://guides.rubyonrails.org/association_basics.html
  has_many :certificates, dependent: :destroy
  has_and_belongs_to_many :organizations, -> { distinct }
  has_many :projects, through: :organizations

  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :name, :username, :email, :public_key, presence: true

  validates :name, format: { with: %r{\A([a-zA-Z]|\s)+\z},
                             message: 'only allows letters and spaces' }

  validates :username, format: { with: %r{\A([a-zA-Z]|[0-9])+\z},
                                 message: 'only allows letters and numbers' }

  before_save :validate_public_key, on: [:create]

  protected

  def validate_public_key
    SSHKey.valid_ssh_public_key?(public_key)
  end
end
