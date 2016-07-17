Function Derp { coffee "$PWD\derp.coffee.md" $args }

Function Make-Account($title, $env="test")
{
    derp create -d $env media_mps_facade Account title="$title" ownerId="urn:theplatform:auth:root"
}
Function prompt 
{ 
Write-Host $PWD -ForegroundColor Blue 
Write-Host "ψ" -ForegroundColor DarkGreen -NoNewline 
return " " 
}
