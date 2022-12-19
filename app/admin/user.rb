ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin
  index do
    selectable_column
    id_column
    column :email
    column :admin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.label :admin, "Admin?"
    f.check_box :admin
    
    f.actions
  end
end
