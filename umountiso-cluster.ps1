###########################################
#
# VMware cluster CD disconenct script
#
# Written By: Andy.Weinberg
#
# Version 1.0, 1/20/2010
#
###########################################

Add-PSSnapin VMware.VimAutomation.Core

# Connect to VI server
$vserver = Read-Host -Prompt "What VI server do you want to connect to?"
Connect-VIServer $vserver 

#Get clusters on the server
$cluster = Get-Cluster

# User to enter what cluster they want to work with

$cluster
$cluster = Read-Host -Prompt "Please Enter the Cluster Name"

# Get the VMhosts of the cluster

$vms = Get-Cluster -Name $cluster | Get-VM

del variable:\cluster
del variable:\vserver

# Determine if CD is mounted and disconnect them
$CDConnected = Get-CDDrive $vms | where {$_.RemoteDevice -like "*.ISO*"}
Set-CDDrive -NoMedia $CDConnected -Confirm


