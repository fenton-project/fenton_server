# A project is a set of machines that all use the same authentication CA
class Project < ApplicationRecord
  # http://guides.rubyonrails.org/association_basics.html
  has_many :certificates, dependent: :destroy
  belongs_to :organization

  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :name, :key, :description, :passphrase, :organization_id,
            presence: true

  validates :name, format: { with: %r{\A([a-zA-Z]|\s|\d)+\z},
                             message: 'only allows letters, numbers & spaces' }

  validates :key, format: { with: %r{\A([a-z]|\d)+\z},
                            message: 'only allows letters and numbers' }

  before_save :create_ca_key, on: [:create]

  before_validation :downcase_key, on: [:create, :update]

  def populate_organization(organization_key)
    self.organization = Organization.find_by_key(organization_key) \
    if organization_key
  end

  protected

  def downcase_key
    self.key = key.downcase
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
