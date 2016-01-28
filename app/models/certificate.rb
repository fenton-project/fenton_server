# A certificate is a signed public key between a project and a client
class Certificate < ApplicationRecord
  # http://guides.rubyonrails.org/association_basics.html
  belongs_to :client
  belongs_to :project

  # http://edgeguides.rubyonrails.org/active_record_validations.html
  validates :client_id, :project_id, presence: true

  before_save :sign_public_key, on: [:create]

  protected

  def sign_public_key
    project_private_key_file = write_key_file(project.ca_private_key)
    client_public_key_file = write_key_file(client.public_key)
    self.certificate = run_signing(project_private_key_file, project.passphrase, client_public_key_file, ['ubuntu'])
  rescue => e
    raise e.message
  ensure
    begin
      FileUtils.rm_r(project_private_key_file)
    rescue
      nil
    end
    begin
      FileUtils.rm_r(client_public_key_file)
    rescue
      nil
    end
  end

  def run_signing(project_private_key_file, project_private_key_passphrase, client_public_key_file, principals)
    epoch = Time.now.to_i
    ssh_keygen = Mixlib::ShellOut.new(
      "ssh-keygen -s #{project_private_key_file} " \
      "-P '#{project_private_key_passphrase}' -I #{epoch} " \
      "-z #{epoch} -n #{principals.join(',')} #{client_public_key_file} " \
      '2>&1'
    ).run_command

    read_certificate_file((ssh_keygen.stdout.gsub('Signed user key ', '').scan %r{.*\.pub}).first) if ssh_keygen.status.success?
  end

  def read_certificate_file(file_path)
    File.read(file_path)
  end

  def write_key_file(content)
    file_path = "tmp/keys/#{SecureRandom.hex(16)}"
    File.write(file_path, content)
    File.chmod(0600, file_path)
    file_path
  end
end
