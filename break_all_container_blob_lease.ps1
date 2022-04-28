# create a context 
$Context = New-AzStorageContext -StorageAccountName "yourstorageaccount" -StorageAccountKey "yourstorageaccountkey"

#set your container name
$Container = "yourcontainername"

#Get a reference to all the blobs in the container.
$blobs = Get-AzStorageBlob -Container $Container -Context $Context

#Remove lease on each Blob
$blobs | %{$_.ICloudBlob.BreakLease()}
