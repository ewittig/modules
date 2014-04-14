class dotnetcms {

	package { 'Microsoft .NET Framework 4.5.1' :
	  ensure => installed,
	  source => 'Z:\Desktop\Morpheus Pre-Install\Server_Tools\NDP451-KB2858728-x86-x64-AllOS-ENU.exe',
	  install_options => ['/Passive', '/NoRestart'],
	  provider => windows,
	}

}
