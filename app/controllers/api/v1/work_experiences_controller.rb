module Api::V1
  class WorkExperiencesController < ApplicationController

    before_action :set_user
    before_action :set_work_experience, only: [:update, :destroy]

    # GET /users/:user_id/work_experiences
    def index
      @work_experiences = @user.work_experiences
      render json: @work_experiences
    end

    # POST /users/:user_id/work_experiences
    def create
      @work_experience = @user.work_experiences.build(work_experience_params)

      if @work_experience.save
        render json: @work_experience, status: :created
      else
        render json: @work_experience.errors, status: :unprocessable_entity
      end
    end

    # PUT/PATCH /users/:user_id/work_experiences/:id
    def update
      if @work_experience.update(work_experience_params)
        render json: @work_experience
      else
        render json: @work_experience.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/:user_id/work_experiences/:id
    def destroy
      @work_experience.destroy
    end

    private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_work_experience
        @work_experience = WorkExperience.find(params[:id])
      end

      def work_experience_params
        params.require(:data).require(:attributes).permit(:title, :company, :location, :start_year, :end_year, :current, :description)
      end

  end
end