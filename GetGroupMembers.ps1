#TD KOESIO 09/2023

#Variables modifiables
$OUPath = "OU=XXX,OU=XXX,OU=XXX,DC=XXX,DC=XXX"


#Preparer l'output
$Output =

ForEach ($dev in (Get-ADGroup -filter * -SearchBase $OUPath | select name))
{
	echo "### $($dev.name) ###"
	Get-AdGroupMember -Identity $dev.name | Select-Object -ExpandProperty Name | Select-Object -Skip 0
	echo "_____" ""
}

$Output | Out-File -FilePath "C:\GroupMembers.txt"
