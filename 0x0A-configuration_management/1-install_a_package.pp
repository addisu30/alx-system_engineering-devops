# Install the puppet-lint package
package { 'puppet-lint':
ensure   => '2.2.2',
provider => 'gem',
}
