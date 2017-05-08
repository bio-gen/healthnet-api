class WorkExperiencesController < ApplicationController

  before_action :set_work_experience, only: [:update, :destroy]

  def create
    @work_experience = WorkExperience.new(work_experience_params)

    if @work_experience.save
      render json: @work_experience, status: :created
    else
      render json: @work_experience.errors, status: :unprocessable_entity
    end
  end

  def update
    if @work_experience.update(work_experience_params)
      render json: @work_experience
    else
      render json: @work_experience.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @work_experience.destroy
  end

  private

    def set_work_experience
      @work_experience = WorkExperience.find(params[:id])
    end

    def work_experience_params
      params.require(:data).require(:attributes).permit(:title, :company, :location, :start_date, :end_date, :current, :description, :user_id)
    end

end
