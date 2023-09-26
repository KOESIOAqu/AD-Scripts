#TD KOESIO 09/2023

#Preparer l'output
$Output =

ForEach ($ADGroup in (Get-ADGroup -filter * | select name ))
{
	
	If ((Get-ADGroup $ADGroup.name -Properties *).Member.Count -ge 1) {
		echo "### $($ADGroup.name) ###"
		Get-AdGroupMember -Identity $ADGroup.name | Select-Object -ExpandProperty Name | Select-Object -Skip 0
		echo "_____" ""
	}	
	
}

$Output | Out-File -FilePath "C:\AllGroupMembers.txt"
