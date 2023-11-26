function Prompt
{
    "PS $($executionContext.SessionState.Path.CurrentLocation)`n$('>' * ($nestedPromptLevel + 1)) "
}

function Out-Default
{
    $items = New-Object System.Collections.Generic.List[object]

    foreach ($item in $input)
    {
        $items.Add($item)
    }

    if (-Not ($items | Out-String).ReplaceLineEndings("`n").EndsWith("`n`n"))
    {
        $items.Add([System.String]::Empty)
    }

    $items | Microsoft.PowerShell.Core\Out-Default
}
