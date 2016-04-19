class AddJobIdToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :job_id, :integer
  end
end
