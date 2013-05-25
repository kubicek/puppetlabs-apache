class apache::mod::mime {
  apache::mod { 'mime': }
  $mime_types_path = $::osfamily ? {
    'freebsd'          => '/usr/local/etc/apache22/mime.types',
    default            => '/etc/mime.types',
  }
  # Template uses $mime_types_path
  file { 'mime.conf':
    ensure  => file,
    path    => "${apache::mod_dir}/mime.conf",
    content => template('apache/mod/mime.conf.erb'),
  }
}
