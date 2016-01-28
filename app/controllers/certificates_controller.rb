# A restful interface to the certificate model
class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :update, :destroy]

  # GET /certificates
  def index
    @certificates = Certificate.all

    render json: @certificates
  end

  # GET /certificates/1
  def show
    render json: @certificate
  end

  # POST /certificates
  def create
    @certificate = Certificate.new(certificate: certificate_params[:certificate],
                                   client_id: certificate_params[:client_id],
                                   project_id: certificate_params[:project_id]
                                  )
    @certificate.project = Project.find_by_name(certificate_params[:project]) if certificate_params[:project]
    @certificate.client = Client.find_by_name(certificate_params[:client]) if certificate_params[:client]

    if @certificate.save
      render json: @certificate, status: :created, location: @certificate
    else
      render json: @certificate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /certificates/1
  def update
    if @certificate.update(certificate_params)
      render json: @certificate
    else
      render json: @certificate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /certificates/1
  def destroy
    @certificate.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_certificate
    @certificate = Certificate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def certificate_params
    params.require(:certificate).permit(:certificate, :client_id, :project_id, :client, :project)
  end
end
