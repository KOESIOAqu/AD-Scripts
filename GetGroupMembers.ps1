#TD KOESIO 09/2023

#Variables modifiables
$OUPath = "OU=XXX,OU=XXX,OU=XXX,DC=XXX,DC=XXX"

#Preparer l'output
$Output =

ForEach ($ADGroup in (Get-ADGroup -filter * -SearchBase $OUPath | select name))
{
	If ((Get-ADGroup $ADGroup.name -Properties *).Member.Count -ge 1) {
		echo "### $($ADGroup.name) ###"
		Get-AdGroupMember -Identity $ADGroup.name | Select-Object -ExpandProperty Name | Select-Object -Skip 0
		echo "_____" ""
  	}
}

$Output | Out-File -FilePath "C:\GroupMembers.txt"
