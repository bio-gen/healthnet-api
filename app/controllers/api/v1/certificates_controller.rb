module Api::V1
  class CertificatesController < ApplicationController
    
    before_action :set_user
    before_action :set_certificate, only: [:update, :destroy]

    # GET /users/:user_id/certificates
    def index
      @certificates = @user.certificates
      render json: @certificates
    end

    # POST /users/user_id/certificates
    def create
      @certificate = @user.certificates.build(certificate_params)

      if @certificate.save
        render json: @certificate, status: :created
      else
        render json: @certificate, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
      end
    end

    # PUT/PATCH /users/:user_id/certificates/:id
    def update
      if @certificate.update(certificate_params)
        render json: @certificate
      else
        render json: @certificate, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
      end
    end

    # DELETE /users/:user_id/certificates/:id
    def destroy
      @certificate.destroy
    end

    private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_certificate
        @certificate = Certificate.find(params[:id])
      end

      def certificate_params
        params.require(:data).require(:attributes).permit(:title, :granted_by, :year)
      end
  end
end
