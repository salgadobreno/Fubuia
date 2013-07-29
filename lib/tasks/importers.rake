namespace :autoimporters do
  desc "Importa os eventos do perfil do fubuia"
  task :fubuia => :environment do
    require 'autoimporters'
    AutoImporters::FubuiaImporter.run
  end

end
