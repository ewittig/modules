define my_lvmaix (
  $lv_name = 'efoovar3',
  $volume_group = 'rootvg',
  $initial_size = '256M',
  $mountpoint = '/mnt/efoovarmnt3',
  $exec_path = '/usr/sbin/',
  $device = '/dev/hdisk0',
  $fstype = 'jfs',
) {

  logical_volume { "my_aix_volume_${title}":
    ensure       => present,
    name         => $lv_name,
    volume_group => $volume_group,
    initial_size => $initial_size,
  }

  exec { "create_logical_volume_${title}":
    command => "crfs -v ${fstype} -d ${lv_name} -m ${mountpoint} -A yes",
    path    => $exec_path,
    subscribe => Logical_volume["my_aix_volume_${title}"],
    refreshonly => true,
    before => Mount[$mountpoint],
  }

  mount { $mountpoint :
    ensure => "mounted",
    device => $device,
    fstype => $fstype,
    pass   => '0',
  }
}
