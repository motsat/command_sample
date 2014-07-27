require 'command_sample/options'
module CommandSample
  class Command

    def self.run(argv)
      new(argv).execute
    end

    def initialize(argv)
      @argv = argv
    end

    def execute
      Options.parse!(@argv)
    end

  end
end
