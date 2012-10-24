module ArdourGit
  module Commands
    class Init
      def self.run
        GitRepository.create
      end
    end
  end
end
