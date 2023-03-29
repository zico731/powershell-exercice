# exercice 1 - Trouver les services qui sont démarré !

Function exo01
{
    Get-Service | Where-Object {$_.Status -eq "Running"}
}

# exercice 2 - Afficher toutes les CMDLETs disponibles en PS
Function exo02
{
    Get-Command -CommandType Cmdlet
    #Get-Help * | Where-Object Category -eq 'Cmdlet'
}

# exercice 3 - Afficher seulement les CMDLETs qui commence par Get
Function exo03
{
    
     Get-Command -CommandType Cmdlet | Where-Object {$_.Name -like "Get*"}

}

# exercice 4 - Trouver comment naviguer entre les répertoires en PS
Function exo04
{
    Set-Location   # Alias: sl,cd,chdir
}

# exercice 5 - Trouver comment afficher le contenu du répertoire courant en PS
Function exo05
{
    Get-ChildItem   #  Alias:  gci, dir, ls (<-- Get-Alias -Definition Get-ChildItem)                                                                                                                                             

}

# exercice 6 - Chercher sur votre OS tous les fichiers supérieur à 300 Mb
Function exo06
{
    Get-ChildItem -Path C:\ -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Length -gt 300MB } | Sort-Object length -Descending  |Select-Object FullName, Length
    #les 10 premiers : Get-ChildItem -Path C:\ -Recurse -File | Where-Object { $_.Length -gt 300MB } | Sort-Object Length -Descending | Select-Object -First 10 FullName, Length 
}

# exercice 7 - vous devez trouver tous les fichiers de plus de 300 Mb et les mettres dans un fichier .csv

Function exo07
{
    Get-ChildItem -Path C:\ -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Length -gt 300MB } | Sort-Object Length -Descending|  Select-Object FullName, Length | Export-Csv -Path C:\fichiers_300MB.csv -NoTypeInformation}

# exercice 8 Écrire un programme qui écrit 500 fois « Je dois faire des sauvegardes régulières de mes fichiers. »
Function exo08
{
    for ($i = 1; $i -le 500; $i++) {
        Write-Host "Je dois faire des sauvegardes régulières de mes fichiers $i"
    }
}

# exercice 9 Écrire un programme qui affiche tous les nombres impairs entre 0 et 15000, par ordre croissant : « 1 3 5 7 ... 14995 14997 14999 »
Function exo09
{
    for ($i = 1; $i -lt 1500; $i = $i + 2) {
        Write-Host $i
    }
}

# exercice 10 Écrire un programme qui affiche la table de multiplication par 13
Function exo10
{
    for ($i = 0; $i -lt 11; $i++) {
       $i * 13
    }
}

# exercice 11 Ecrire un programme qui demande un mot à l’utilisateur et qui affiche à l’écran le nombre de lettres de ce mot.
Function exo11
{
    $word = Read-Host 'Saisir un mot'
    $word.Length
}

# exercice 12 Ecrire un programme qui demande un nombre entier à l’utilisateur. L’ordinateur affiche ensuite le message "Ce nombre est pair" ou "Ce nombre est impair" selon le cas.
Function exo12
{
    [int]$number = Read-Host 'Saisir un nombre'
    if ($number % 2)
    {
        Write-Host "Nombre impaire"
    }
    else
    {
        Write-Host "Nombre paire"
    }
}

# exercice 13 Ecrire un programme qui demande un nombre compris entre 10 et 20, jusqu’à ce que la réponse convienne. En cas de réponse supérieure à 20, on fera apparaître un message : « Plus petit ! », et inversement, « Plus grand ! » si le nombre est inférieur à 10.

Function exo13
{
    [int]$number = Read-Host 'Saisir un nombre compris entre 10 et 20'

    if ($number -lt 10)
    {   
        Write-Host "Plus grand !"
        exo13
     }

     if ($number -gt 20)
     {
         Write-Host "Plus petit !"
         exo13
      }
    
     if ($number -ge 10 -and $number -le 20)
     {
        Write-Host "Bonne réponse ! "
     }

}

# exercice 14 Ecrire un programme qui demande un nombre de départ, et qui ensuite affiche les dix nombres suivants. Par exemple, si l'utilisateur entre le nombre 17, le programme affichera les nombres de 18 à 27.
Function exo14
{
    [int]$number = Read-Host 'Saisir un nombre de départ'
    for ($i = $number; $i -lt $number + 10; $i++) {
        write-host $i
    }
}

# exercice 15 Ecrire un programme qui demande un nombre de départ, et qui ensuite écrit la table de multiplication de ce nombre.

Function exo15
{
    [int]$number = Read-Host 'Saisir un nombre, pour connaitre la table de multiplication'
    for ($i = 1; $i -lt 11; $i++) {
        write-host "$i x $number ="($i * $number)
    }
}

# exercice 16 Ecrire un programme qui demande un nombre de départ, et qui calcule la somme des entiers jusqu’à ce nombre. Par exemple, si l’on entre 5, le programme doit calculer : 1 + 2 + 3 + 4 + 5 = 15, afficher que le résultat

Function exo16
{
    [int]$number = Read-Host "Saisir un nombre, pour connaitre la somme des entiers jusqu’à ce nombre"
    $count = 0
    for ($i = 0; $i -le $number; $i++) {
        $count = $count + $i
    }
    $count
}


# exercice 17 Ecrire un programme qui demande l’âge d’un enfant à l’utilisateur. Ensuite il l’informe de sa catégorie :
# 	” de 6 à 7 ans
# 	de 8 à 9 ans
# 	ime” de 10 à 11 ans
# 	après 12 ans

Function exo17
{
    [int]$number = Read-Host "Saisir un nombre l’âge d’un enfant pour connaitre sa catégorie"
    if ($number -ge 6 -and $number -le 7) {
        Write-Host "Poussin"
    }
    elseif ($number -ge 8 -and $number -le 9)
    {
        Write-Host "Pupille"
    }
    elseif ($number -ge 10 -and $number -le 11)
    {
        Write-Host "Minime"
    }
    elseif ($number -ge 12)
    {
        Write-Host "Cadet"
    }
    else
    {
        Write-Host "Too small"
    }
}

# exercice 18 - Vous devez trouver tous les fichier .txt et les renommer en .old

Function exo18
{
    Get-ChildItem -Path . -Filter *.txt | Rename-Item -NewName { $_.Name -replace '\.txt$','.old' }
    #Get-ChildItem -Path . -Filter *.txt | Rename-Item -NewName {[System.IO.Path]::ChangeExtension($_.Name, ".old")
}

# exercice 19 - Faire un script qui demande à l’utilisateur d’entrer le numéro du département où il habite et le script affichera le nom de celui-ci.
# aide: https://api.gouv.fr/api/api-geo.html

Function exo19 ([Parameter(Mandatory=$true)] [string]$numero_departement)
{
    # Ajouter un 0 devant le numéro de département si nécessaire, et mettre en majuscule
    $numero_departement = $numero_departement.PadLeft(2, '0').ToUpper()

    # Faire une requête à l'API Geo pour récupérer les informations sur le département
    $url = "https://geo.api.gouv.fr/departements/$numero_departement"
    $response = Invoke-RestMethod $url

    # Afficher le nom du département
    Write-Host "Vous habitez dans le département de $($response.nom)"
}

# exercice 20 - Écrire un programme qui calcule la factorielle de n.

Function exo20
{
    [int]$number = Read-Host 'Saisir un nombre entier, pour connaitre la factorielle de ce nombre'
    $count = $number
    while ($number -gt 1)
    {
        $number = $number - 1
        $count *= $number
    }
    $count
}

# exercice 21 - Écrire un programme qui convertit un nombre décimal (base 10) en binaire (base 2)

Function exo21([int]$decimal)
{
# Initialisation de la variable binaire
$binaire = ""

# Boucle tant que le nombre décimal est supérieur à 0
while ($decimal -gt 0) 
    {
    # Calcul du reste de la division décimale par 2
    $reste = $decimal % 2

    # Concaténation du reste (converti en string) à la chaîne binaire existante
    $binaire = $reste.ToString() + $binaire

    # Division décimale par 2 avec arrondi vers le bas pour obtenir le prochain quotient décimal à traiter
    $decimal = [math]::Floor($decimal / 2)
    }
# Retourne la chaîne binaire résultante
return $binaire
}

# exercice 22 - Si nous listons tous les nombres naturels inférieurs à 10 qui sont des multiples de 3 et 5, nous avons 3, 5, 6 et 9. La somme de ces multiples est 23.
#     Trouvez la somme de tous les multiples de 3 et 5 inférieurs à 1000.

Function exo22
{
    $somme = 0
    for ($i = 1; $i -lt 1000; $i++) 
    {
        if ($i % 3 -eq 0  -or $i % 5 -eq 0)
        {
          $somme += $i
        }    
    }
    Write-Host "La somme de tous les multiples de 3 et 5 inférieurs à 1000 est : $somme"    
}

# exercice 23 - Écrire un programme qui affiche le 1500ème nombre de la suite de Fibonacci.
Function exo23
{
    # Importer la bibliothèque System.Numerics
Add-Type -AssemblyName System.Numerics

# Définir les deux premiers termes de la suite
$term1 = [System.Numerics.BigInteger]::Zero
$term2 = [System.Numerics.BigInteger]::One

# Boucle pour calculer les termes suivants
for($i=2; $i -le 1500; $i++)
{
    $temp = $term1 + $term2
    $term1 = $term2
    $term2 = $temp
}

# Afficher le 1500ème terme
Write-Host "Le 1500ème nombre de la suite de Fibonacci est : $term2"


}


# exercice 24 - Écrire un programme qui affiche le plus petit nombre positif divisible par tous les nombres de 1 à 20 avec un résultat entier.

Function exo24
{
function ppcm($p, $n) {
    for ($k = 1; $k -le $n; $k++) {
        $z = $k * $p
        if ($z % $n -eq 0) {
            return $z
        }
    }
}

$p = 1
$n = 20
for ($i = 1; $i -le $n; $i++) {
   $p = ppcm $p $i
}
Write-Host $p
}
