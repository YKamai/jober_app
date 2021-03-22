class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: 'Job was successfully created.' }
      else
        format.html { redirect_to jobs_path, notice: 'Job was not created.' }
      end
    end
  end

  private

  def job_params
    params = {
      priority: (0..5).to_a.sample,
      attempts: (0..10).to_a.sample,
      handler: 'JobHandler',
      run_at: Time.now,
      locked_at: [nil, Time.now].sample,
      failed_at: [nil, Time.now].sample,
      queue: %w[default primary secondary].sample,
      last_error: '', locked_by: ''
    }
    params[:locked_by] = 'JobLocker' if params[:locked_at]
    params[:last_error] = 'Something was wrong!' if params[:failed_at]
    params
  end
end
