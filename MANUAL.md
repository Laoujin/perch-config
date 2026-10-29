Stuff Done Manually
===================

FileZilla
---------

Base64 encoded passwords.  
Stored in `%APPDATA%/FileZilla`.
Synced but excluded from git.


Dropbox
-------

`rules.dropboxignore` only applies to folders created after the rule.
Existing matches must be marked once (removes them from the cloud and other PCs):

```powershell
$r = "$env:USERPROFILE\Dropbox"
Get-ChildItem $r -Directory -Recurse -Force -Include node_modules,obj,Debug,Release |
  ? { $_.FullName -notmatch '\\node_modules\\.+' -and ($_.Name -notin 'Debug','Release' -or $_.Parent.Name -eq 'bin') } |
  % { Set-Content -LiteralPath $_.FullName -Stream com.dropbox.ignored -Value 1 }
```


HeidiSQL
--------

Storing a manual backup here for now.  
Bestand > Instellingsbestand importeren/exporteren > HeidiSQL.txt


Settings stored in:  
```
regedit => HKEY_CURRENT_USER => Software => Heidisql
```

Decoding a password:  
```c#
function heidiDecode(hex) {
    var str = '';
    var shift = parseInt(hex.substr(-1));
    hex = hex.substr(0, hex.length - 1);
    for (var i = 0; i < hex.length; i += 2)
      str += String.fromCharCode(parseInt(hex.substr(i, 2), 16) - shift);
    return str;
}

console.log(heidiDecode('pwd from file'));
```
