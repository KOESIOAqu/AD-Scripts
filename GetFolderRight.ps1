#TD KOESIO 09/2023

#Variables modifiables
$path = "C:\Partages"
$pathDepth = 0


#Recuperer tous les dossiers en fonction de la profondeur et du chemin choisi
$FolderPath = Get-ChildItem -Directory -Path $path  -Recurse -Depth $pathDepth -Force

#Preparer l'output
$Output =

ForEach ($folder in $folderPath) {  
    
    #Afficher dans quel dossier nous sommes
    echo "### $($folder.FullName) ###"
    #Récuperer les infos des droits brutes  du dossier actuel
    $acl = Get-Acl -Path $folder.FullName
    
    #Boucle pour chaque utilisateur trouvé
    ForEach ($AllaccessFullPath in $acl.Access) {
        
        #Récuperer uniquement le nom de l'user sans son chemin dans l'OU
        ForEach ($accessFullPath in $AllaccessFullPath.IdentityReference){
            #Split via le caractère \
            $splitedAccess = $accessFullPath -Split '\\'
            #Récuperer utilisateur 
            $access = $splitedAccess[-1]
            #Afficher les users et leurs droits
            echo "$($access) : $($AllaccessFullPath.FileSystemRights)"         
        }

    }
    echo "_____" ""
}
$Output | Out-File -FilePath "C:\FolderRight.txt"