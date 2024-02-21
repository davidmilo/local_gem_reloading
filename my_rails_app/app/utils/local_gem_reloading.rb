class LocalGemReloading
  def self.setup_reloading_for_local_zeitwerk_gem(gem_name, local_gems_folder)
    gem_path = Pathname.new(File.join(local_gems_folder, gem_name, "lib"))

    parts = gem_name.split("-")
    gem_root = parts.delete(parts.last)
    gem_namespaces = parts.map(&:camelize)
    
    loader_tag = "#{[gem_namespaces.join("::"), gem_root.underscore].join('-')}"

    gem_loader = Zeitwerk::Registry.loaders.find { |loader| loader.tag == loader_tag }

    file_watcher = ActiveSupport::FileUpdateChecker.new(gem_path.glob('**/*')) do
      gem_loader.reload
    end
   
    Rails.application.reloaders << Class.new do 
      def initialize(file_watcher)
        @file_watcher = file_watcher
      end
   
      def updated?
        @file_watcher.execute_if_updated
      end
    end.new(file_watcher)
    true
  end
end
