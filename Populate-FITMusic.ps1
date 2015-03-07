$SourceFolder = 'C:\CloudMusic'
$TargetFolder = 'G:'

cls

Write-Host "Clean targer"

del (Join-Path $TargetFolder '*') -Recurse -ErrorAction Continue

Read-Host

Write-Host "Get random source file list"

$Files = ls $SourceFolder *.mp3 | sort { Get-Random }

$TargetSubFolder = $TargetFolder

$Counter = 0

$SubFolderName = 1

Write-Host "Copy files"

foreach ($File in $Files)
{
    cp $File.FullName (Join-Path $TargetSubFolder $File.Name)
    
    $Counter++

    if ($Counter -eq 99)
    {
        $Counter = 0
        $SubFolderName ++
        $TargetSubFolder = Join-Path $TargetFolder "CD$SubFolderName"
        mkdir $TargetSubFolder
    }
}

Write-Host "Done"
