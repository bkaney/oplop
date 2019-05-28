Oplop
=====

This is a ruby implementation of Oplop http://code.google.com/p/oplop/, supporting the long oplop variation (see: https://github.com/thedod/loplop).

Install
=======

```
gem install oplop
```

Usage
=====

Oplop and Loplop. Long Oplop defaults to 16 characters and support `<n>*` label
prefix for specifying length.

These will all produce the same password with the new default 16 character length:

```ruby
Oplop::V1.password(:master => "master-password", :label => "nickname")
Oplop::V1.password(:master => "master-password", :label => "16*nickname")
Oplop::V1.password(:master => "master-password", :label => "nickname", :length => 16)
```

These will all produce the same password with the legacy 8 character length:
```
Oplop::V1.password(:master => "master-password", :label => "*nickname")
Oplop::V1.password(:master => "master-password", :label => "8*nickname")
Oplop::V1.password(:master => "master-password", :label => "nickname", :length => 8)
```

This is a 20-character password
```
Oplop::V1.password(:master => "master-password", :label => "20*nickname")
```

CLI
===

This includes an `oplop` program that defaults to 8 character passwords. And a
new `loplop` program that defaults to 16 character passwords.

Run `oplop --help` for more information.

License
=======

MIT
