require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Attempts", with: @job.attempts
    fill_in "Failed at", with: @job.failed_at
    fill_in "Handler", with: @job.handler
    fill_in "Last error", with: @job.last_error
    fill_in "Locked at", with: @job.locked_at
    fill_in "Locked by", with: @job.locked_by
    fill_in "Priority", with: @job.priority
    fill_in "Queue", with: @job.queue
    fill_in "Run at", with: @job.run_at
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Attempts", with: @job.attempts
    fill_in "Failed at", with: @job.failed_at
    fill_in "Handler", with: @job.handler
    fill_in "Last error", with: @job.last_error
    fill_in "Locked at", with: @job.locked_at
    fill_in "Locked by", with: @job.locked_by
    fill_in "Priority", with: @job.priority
    fill_in "Queue", with: @job.queue
    fill_in "Run at", with: @job.run_at
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
