module Api::V1
  class EducationsController < ApplicationController

    before_action :set_user
    before_action :set_education, only: [:update, :destroy]

    # GET /users/:user_id/educations
    def index
      @educations = @user.educations
      render json: @educations
    end

    # POST /users/:user_id/educations
    def create
      @education = @user.educations.build(education_params)

      if @education.save
        render json: @education, status: :created
      else
        render json: @education, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
      end
    end

    # PUT/PATCH /users/:user_id/educations/:id
    def update
      if @education.update(education_params)
        render json: @education
      else
        render json: @education, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
      end
    end

    # DELETE /users/:user_id/educations/:id
    def destroy
      @education.destroy
    end

    private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_education
        @education = Education.find(params[:id])
      end

      def education_params
        params.require(:data).require(:attributes).permit(:school, :degree, :field, :description, :start_year, :end_year, :current)
      end

  end
end
