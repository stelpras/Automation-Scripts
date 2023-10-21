# Define the WMI namespace, class, and method names
$namespaceName = "root\cimv2\mdm\dmmap"
$className = "MDM_RemoteWipe"
$methodName = "doWipeMethod"

# Create a new CIM session
$session = New-CimSession

# Create a collection for method parameters
$params = New-Object Microsoft.Management.Infrastructure.CimMethodParametersCollection

# Create a parameter for the remote wipe method
$param = [Microsoft.Management.Infrastructure.CimMethodParameter]::Create("param", "", "String", "In")
$params.Add($param)

# Try to perform the remote wipe operation
try
{
    # Get the instance of the MDM_RemoteWipe class
    $instance = Get-CimInstance -Namespace $namespaceName -ClassName $className -Filter "ParentID='./Vendor/MSFT' and InstanceID='RemoteWipe'"

    # Invoke the remote wipe method using the session and parameters
    $session.InvokeMethod($namespaceName, $instance, $methodName, $params)
}
catch [Exception]
{
    # If an exception occurs, display the error
    write-host $_ | out-string
}
