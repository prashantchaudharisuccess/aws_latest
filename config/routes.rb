Rails.application.routes.draw do
  get 'bucket_files/index'

  get 'disk/index'
  devise_for :users
  devise_scope :user do
  	root to: "devise/sessions#new"
  end

  get 'root/coffer/new'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile' 
  get '/registrationnew' => 'devise/registrations#new'
  post '/disks/:disk_id/disk_file_upload/:name', to: 'disks#upload_file', as: 'upload_file'
  resources :disks
  resources :bucket_files
  get '/files/disk/move_file_form/:name/:file_name', to: 'bucket_files#move_file_form', as: 'move_file_form', format: false, defaults: { format: 'html' }, constraints: { file_name: %r{[^\/]+} }
  # get '/disks', to: 'disks#index', as: disks_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/disks/:disk_id/calculate_disk', to: 'disks#calculate_disk_size', as: 'calculate_disk_size'
	get '/disks/:disk_id/disk_file_upload/:name', to: 'bucket_files#disk_file_upload', as: 'disk_file_upload'
  post '/files/disk/move_file_form/:name/:file_name', to: 'bucket_files#file_move', as: 'file_move_path', format: false, defaults: { format: 'html' }, constraints: { file_name: %r{[^\/]+} }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
