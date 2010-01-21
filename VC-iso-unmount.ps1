#******************************************************
#
# VMware Host CDrom ISO unmount Script
#
# Written By: Andy Weinberg
#
# Version 1.0, 1/7/2010
#
#****************************************************


Add-PSSnapin VMware.VimAutomation.Core

Connect-VIServer vcusa

$vms = Get-VM

$CDConnected =  Get-CDDrive $vms | where {$_.RemoteDevice -like "*.ISO*"}

Set-CDDrive -Connected 0 $CDConnected
