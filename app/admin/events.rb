ActiveAdmin.register Event do

  filter :id
  filter :name
  filter :active
  filter :start_at

  index do
    column :id
    column :name
    column :start_at
    column :end_at
    column :active
    column :user_id
    column "Action" do |event|
      link_to "Deactivate", deactivate_admin_event_path(event)
    end

    default_actions
  end

  member_action :deactivate do
    Event.find(params[:id]).deactivate!
    redirect_to(:back)
  end

  collection_action :new_import, :method => :get do
  end

  collection_action :import_event, :method => :post do
    if params[:fid].present?
      #TODO: make this shit elegant
      Event.pull_and_create(params[:fid], User.first, City.first) 
      redirect_to action: :index
    elsif params[:fids].present?
      fids = params[:fids].split(/(,|\r\n|\n)/).map(&:strip)
      fids.each {|f| Event.pull_and_create(f, User.first, City.first)}
      redirect_to action: :index
    else
      flash[:error] = "Please provide a FID, bisho"
      redirect_to :back
    end
  end

  action_item do
    link_to "Import", new_import_admin_events_path
  end

end
