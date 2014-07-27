require 'optparse'
require 'pry'

module CommandSample
  class Command
    module Options

      def self.parse!(argv)
        options = {}
        # sub_command_parsers = create_sub_command_parsers(options)
        # command_parsers     = create_command_parsers()

        sub_command_parsers = Hash.new do |k,v|
          raise ArgumentError, "'#{v}' is not command_sample sub command."
        end

        sub_command_parsers['show'] = OptionParser.new do |opt|
          opt.on('-i val', '--input=val', 'input file name') { |v| options[:input_file] = v}
        end

        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.on('-i val', '--input=val', 'input file name') { |v| options[:input_file] = v}
          opt.on('-o val', '--output=val', 'input file name') { |v| options[:output_file] = v}
        end

        command_parser = OptionParser.new do |opt|
          opt.on('-v', '--version', 'show vaersion') do |v|
            puts VERSION
            exit
          end
        end

        binding.pry
        command_parser.order!(argv)
        options
      end

      def self.create_sub_command_parsers(options)

      end

    end
  end
end
