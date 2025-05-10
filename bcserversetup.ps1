$containerName = 'bcserver' # Edit your container
$password = 'P@ssw0rd' # Edit your password
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object pscredential 'admin', $securePassword
$auth = 'UserPassword'
$artifactUrl = Get-BcArtifactUrl -type 'OnPrem' -version '15.4.41023.41345' -country 'na' -select 'Closest'

New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -memoryLimit 6G `
    -includeAL -doNotExportObjectsToText `
    -vsixFile (Get-LatestAlLanguageExtensionUrl) `
    -updateHosts `
    -additionalParameters @(
    # Mapping port to real harware server
        "--publish 80:80",       # Web Client (HTTP)
        "--publish 7049:7049",   # Dev endpoint
        "--publish 7048:7048",   # SOAP/OData
        "--publish 443:443",     # Web Client (HTTPS, if using SSL)
        "--publish 7045:7045",
        "--publish 7046:7046",
        "--publish 7047:7047",
        "--publish 7083:7083",
        "--publish 1433:1433",
        "--publish 5986:5986",
        "--publish 8080:8080"
    )
