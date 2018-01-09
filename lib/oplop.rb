require 'digest/md5'
require 'base64'

module Oplop

  CLASSIC_LENGTH = 8
  DEFAULT_LENGTH = 16

  #
  # Oplop.password(:master => 'p@ssw0rd', :label => 'github')
  #
  def self.password(args={})
    unless (args.keys.include?(:master) && args.keys.include?(:label))
      raise ArgumentError.new 'Master and label are required arguments.'
    end

    length = DEFAULT_LENGTH
    label = args.delete(:label)
    master = args.delete(:master)

    if label =~ /^([0-9]*)?\*/
      (length, label) = label.split('*')
      length = length.to_i
      length = CLASSIC_LENGTH if length <= 0
      length = 22 if length > 22
    end

    master_label = '%s%s' % [ master, label ]

    raise ArgumentError.new "Unknown keys #{args.keys.join(',')}." if args.keys.any?


    password = urlsafe_b64encode(Digest::MD5.digest(master_label))

    if password.respond_to?(:encode)
      password = password.encode('UTF-8')
    end

    if m = password.match(/\d+/)
      password = '%s%s' % [ m[0], password ] if (m.begin(0) >= length)
    else
      password = '1%s' % password
    end

    password[0,length]
  end

  # See http://www.ietf.org/rfc/rfc4648.txt
  # Ruby 1.8.x does not have this as part of the Base64 lib
  def self.urlsafe_b64encode(string)
    Base64.encode64(string).tr('+/', '-_')
  end

end
