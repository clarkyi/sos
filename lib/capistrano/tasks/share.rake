
namespace :share do 
  task :init_path do
    on roles(:web) do   
      execute "mkdir -p #{deploy_to}/shared/log"
      execute "mkdir -p #{deploy_to}/shared/pids"
      execute "touch #{deploy_to}/shared/log/production.log"
      execute "mkdir -p #{release_path}/tmp" 
    end
  end

  task :link_files do
    on roles(:web) do
      execute "ln -sf #{deploy_to}/shared/pids #{deploy_to}/current/tmp/"
      execute "ln -sf #{deploy_to}/shared/log/* #{deploy_to}/current/log"      
    end
  end
end
