# PowershellScripts


### GetGroupMembers ###
"GetGroupMembers.ps1", permet de sortir un fichier "GroupMembers.txt" à la racine de C.
Le script sort les membres de chaque groupe pour une OU spécifique (Y'a encore de quoi faire pour améliorer l'output imo).
Une variable modifiable :
	- "OUFolder", ligne 4

### GetAllGroupMembers ###
"GetAllGroupMembers.ps1", permet de sortir un fichier "AllGroupMembers.txt" à la racine de C.
Le script sort les membres de chaque groupe AD où il y a plus de 1 membre

### GetFolderRight ###
"GetFolderRight.ps1", permet de sortir un fichier "FolderRight.txt" à la racine de C.
Le script sort les droits d'utilisation du dossier ciblé de façon plus lisible (Idem pour celui-ci, y'a encore de quoi faire pour améliorer l'output) que ce qu'on trouve sur internet.
2 variables sont modifiables: 
	- "path", ligne 4, qui est le chemin du dossier ciblé (On mettra souvent la racine du dossier partagé)
	- "pathDepth", ligne 5, qui permet de définir à quelle profondeur le script va chercher les info (0 = racine de "path", 1 = sous-dossier, 2 = sous-dossier de sous-dossier, etc)
Si l'on veut faire TOUS les dossiers, il suffit de supprimer "-Depth $pathDepth" ligne 8 
