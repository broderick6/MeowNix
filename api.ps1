#Basic Authentication Method

#Hardcoded credentials

$username = "test"
$password = Get-Content '.\securestring.txt' | ConvertTo-SecureString
$Cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password

#Dynamic Credentials

#$Cred = Get-Credential

$Params = @{
Uri = "https://jsonplaceholder.typicode.com/posts"
Authentication = "Basic"
Credential = $Cred
}

$response = Invoke-RestMethod @Params

$response[0]

#Foreach Loop

# foreach ($item in $response){
# if($item.id -lt 6)
# {
#     $item
# }
# }

#for loop example

#For ($i=0; $i -le 10; $i++) {
#$item[$i]
#    }


#Token Exists OAuth Method
#$accessToken = ConvertTo-SecureString (Get-Clipboard) -AsPlainText -Force
#Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/me" -Authentication OAuth -Token $accessToken

#Standard OAuth Method
#$accessToken = Get-Clipboard
#Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/me" -Headers @{"Authorization"="Bearer $accessToken"}