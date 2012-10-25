module ArdourGit
  module Commands
    class Save
      def self.run(message)
        files = ArdourFiles.list
        audio_files = ArdourFiles.list_audio
        GitRepository.add(files)
        GitRepository.add_big(audio_files)
        GitRepository.commit(message)
      end
    end
  end
end
