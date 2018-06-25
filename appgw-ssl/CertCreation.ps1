New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -dnsname www.contoso2.com

$pwd = ConvertTo-SecureString -String "<insert your passwd>" -Force -AsPlainText
Export-PfxCertificate -cert cert:\localMachine\my\<insert thumbprint from creation> -FilePath c:\appgwcert2.pfx -Password $pwd

#Use the following to get the Cert Data for the parameters file. 
#Note that it may have carriage returns that you'll need to remove before putting in the params file
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("c:\appgwcert2.pfx"))
