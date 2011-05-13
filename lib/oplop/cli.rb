module Oplop
  module Cli
    
    def self.help
      help = <<-HELP
Usage: oplap [OPTION] [label]

Simple cli program to generate oplap passwords.

You will be prompted for your master password.  If you are 
on a Mac (or have pbcopy installed), or if you have xclip 
installed, the password will be copied to your clipboard.

Options:

  --help        : This help message
  --new         : Runs in new mode, double prompts for
                  master password.
  
Examples:

Get my github password:

  oplap github

Generate a new password for amazon:

  oplap --new amazon

HELP
    end

    def self.copy_to_clipboard(string)
      if (copy_program = `which pbcopy`) && !copy_program.empty?
        system("echo #{string} | #{copy_program}")
      elsif (copy_program = `which xclip`) && !copy_program.empty?
        system("echo #{string} | #{copy_program}")
      end
    end
    
  end
end
