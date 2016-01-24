# A client is a single entity that authenticates to a machine
class Client < ApplicationRecord
  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :name, :public_key, presence: true

  validates :name, format: { with: /\A([a-zA-Z]|\s)+\z/,
                             message: 'only allows letters and spaces' }

  before_save :validate_public_key, on: [:create]

  protected

  def validate_public_key
    SSHKey.valid_ssh_public_key?(self.public_key)
  end
end
