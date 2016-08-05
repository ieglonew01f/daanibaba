ActiveAdmin.register Visitor do
  permit_params :name, :email, :ip
end
