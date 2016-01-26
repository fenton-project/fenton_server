# A project is a set of machines that all use the same authentication CA
class Project < ApplicationRecord
  # http://guides.rubyonrails.org/association_basics.html
  has_many :certificates, dependent: :destroy

  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :name, :description, :passphrase, presence: true

  validates :name, format: { with: /\A([a-zA-Z]|\s)+\z/,
                             message: 'only allows letters and spaces' }

  before_save :create_ca_key, on: [:create]

  protected

  def key
    name.downcase.gsub(/\s+/, '_').to_s
  end

  def create_ca_key
    ca_key = generate_ca_key
    self.ca_private_key = ca_key.private_key
    self.ca_public_key = ca_key.ssh_public_key
  end

  def generate_ca_key(type = 'RSA', bits = 4096)
    SSHKey.generate(
      type: type,
      bits: bits,
      comment: "#{key}@fenton",
      passphrase: passphrase
    )
  end
end
