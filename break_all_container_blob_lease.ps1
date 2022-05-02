#Powershell version
$PSVersionTable.PSVersion

#Import module AZ
Install-Module -Name Az

#Check if the module AZ is installed
Get-InstalledModule -Name Az


#Login with an Azure AD credential that has either storage account owner or contributer Azure role assignment
Connect-AzAccount

#Get subscription
Get-AzSubscription 
# Set Subscription
Select-AzSubscription -subscriptionid yoursubscriptionid

# create a context 
$Context = New-AzStorageContext -StorageAccountName "yourstorageaccount" -StorageAccountKey "yourstorageaccountkey"

#set your container name
$Container = "yourcontainername"

#Get a reference to all the blobs in the container.
$blobs = Get-AzStorageBlob -Container $Container -Context $Context

#Remove lease on each Blob
$blobs | %{$_.ICloudBlob.BreakLease()}
