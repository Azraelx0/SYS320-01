<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}


function checkPassword($password){
    # Convert to plaintext for validation process
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
    
    # Check if password is at least 6 characters
    if($plainPassword.Length -lt 6){
        return $false
    }
    # Check if password contains at least 1 letter
    if($plainPassword -notmatch "[a-zA-Z]"){
        return $false
    }
    # Check if password contains at least 1 number
    if($plainPassword -notmatch "[0-9]"){
        return $false
    }
    # Check if password contains at least 1 special character
    if($plainPassword -notmatch "[^a-zA-Z0-9]"){
        return $false
    }
    # Return true if all conditions met
    return $true
}