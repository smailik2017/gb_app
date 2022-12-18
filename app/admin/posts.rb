ActiveAdmin.register Post do
  permit_params :title, :content
  index do
    selectable_column
    id_column
    column :title
    column :content
    column :created_at
    column :likes_count
    
    actions
  end

  filter :email
  filter :title
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :created_at
    end

    f.actions
  end
end
