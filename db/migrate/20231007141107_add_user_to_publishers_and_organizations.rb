class AddUserToPublishersAndOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_reference :publishers, :user, index: true
    add_reference :organizations, :user, index: true
  end
end
