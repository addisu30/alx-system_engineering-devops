# Using Puppet, install puppet-lint
package { 'puppet-lint':
ensure          =>  'installed',
install_options =>  ['-f', '2.1.0'],
}
