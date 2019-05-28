require 'digest/md5'
require 'base64'

module Oplop
  class V1
    attr_reader :master, :label, :length

    LEGACY_LENGTH = 8
    DEFAULT_LENGTH = 16

    def self.password(args={})
      self.new(args).password
    end

    def initialize(args={})
      @master = args[:master]
      @label = args[:label]
      @length = args[:length] || DEFAULT_LENGTH

      if @label =~ /^([0-9]*)?\*/
        (@length, @label) = @label.split('*')
        @length = length.to_i
        @length = LEGACY_LENGTH if length <= 0
      end
    end

    def master_label
      @master_label ||= '%s%s' % [ master, label ]
    end

    def password
      password = Base64.urlsafe_encode64(Digest::MD5.digest(master_label))

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
  end
end
