my_lvmaix { 'foo':
  lv_name => 'lv_foo',
  volume_group => 'rootvg',
  initial_size => '256M',
  mountpoint => '/mnt/mntfoo',
  exec_path => '/usr/sbin/',
  device => '/dev/hdisk0',
  fstype => 'jfs',
}
