"ZnServer startDefaultOn: 8080."
"SmalltalkImage current snapshot: true andQuit: true"
Metacello new
  baseline: 'TelePharo';
  repository: 'github://pharo-ide/TelePharo';
  load: 'Server'.
"TlpRemoteUIManager registerOnPort: 40423."

