ActiveAdmin.register User do
  
  index do
    column :id
    column :email
    column :active
    column :oauth_expires_at
    column "Ecount" do |user|
      user.events.count
    end
  end
  
end
