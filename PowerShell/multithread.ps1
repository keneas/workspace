# Load Smo and referenced assemblies.
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.ConnectionInfo');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.Management.Sdk.Sfc');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO');
# Requiered for SQL Server 2008 (SMO 10.0).
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMOExtended');

$server =  New-Object Microsoft.SqlServer.Management.Smo.Server "ENG1VMDEVSRV7";
$db = $server.Databases.Item("KMCLRK_SAFEWAY");

[String] $sql1 = "insert into testing(b) values(1)";
[String] $sql2 = "insert into testing(b) values(2)";


Start-Job -ScriptBlock {
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.ConnectionInfo');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.Management.Sdk.Sfc');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMOExtended');
sleep 3
$server =  New-Object Microsoft.SqlServer.Management.Smo.Server "ENG1VMDEVSRV7";
$db = $server.Databases.Item("KMCLRK_SAFEWAY");
[String] $sql1 = "insert into testing(b) values(1)";
$db.ExecuteNonQuery($sql1);}; 
Start-Job -ScriptBlock { 
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.ConnectionInfo');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.Management.Sdk.Sfc');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO');
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMOExtended');
$server =  New-Object Microsoft.SqlServer.Management.Smo.Server "ENG1VMDEVSRV7";
$db = $server.Databases.Item("KMCLRK_SAFEWAY");
[String] $sql2 = "insert into testing(b) values(2)";
$db.ExecuteNonQuery($sql2);};

#Start-Job -ScriptBlock {Write-Host 'a'; };
#Start-Job -ScriptBlock { Write-Host 'b';};

#Invoke-Command -command { Write-Host 'a';}
#Invoke-Command -command { Write-Host 'b';}

#Invoke-Command -command { $db.ExecuteNonQuery($sql1);}
#Invoke-Command -command { $db.ExecuteNonQuery($sql2);}
#$table = $result.Tables[0];

