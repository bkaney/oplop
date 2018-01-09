require 'open3'

class Oplop
  module Cli

    def self.banner
      "Usage: oplop [OPTIONS] [label]"
    end

    def self.help
      help = <<-HELP
This is a simple cli program to generate oplop passwords.

You will be prompted for your master password.

The default behavior is to copy the password to your clipboard, and not display
it.  This works if you are on a Mac (and/or have pbcopy installed), or if you
have xclip (installed for Linux).

If you do not have pbcopy or xclip, you will have to run the program in verbose
mode (--verbose).

Here are some examples:

Copy my github password to clipboard:
  oplop github

Print my gmail password to STDOUT.
  oplop --verbose gmail

Copy a new password for amazon (prompts for master twice):
  oplop --new amazon

NEW: loplop

There is a new cli program called `loplop`, or long oplop.  It will default to
passwords of 16 characters. It also has a new UX feature to specify the length:

  loplop <n>*<label>

Where <n> is how long the password will be. The max is 22 characters. If you
start a label with *, it is a short-cut to the legacy length 8 (in other words
`8*label` and `*label` will generate the same password).

See: https://github.com/thedod/loplop


Feedback, patches and bugs: https://github.com/bkaney/oplop
HELP
    end

    def self.copy_to_clipboard(string)
      copy_program = `which pbcopy`.strip
      copy_program = `which xclip`.strip if copy_program.empty?
      clipboard(copy_program, string) unless copy_program.empty?
    end

    def self.clipboard(copy_program, string)
      Open3.popen3(copy_program) do |stdin, stdout, stderr, wait_thr|
        stdin.print string
        stdin.close
        # ruby 1.9 has wait_thr, 1.8 doesn't
        if wait_thr.nil?
          !! stderr.read.strip
        else
          wait_thr.status
        end
      end
    end

  end
end
