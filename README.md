# abgabetool
Ein einfaches Tool für Prüfungsabgaben.

Kann beispielsweise in folgender Situation verwendet werden:
Die Schüler arbeiten auf einer LiveCD, wo sie mittels bash diverse Aufgaben lösen. Der Prüfungsinstruktor ist dann mit der Aufgabe konfrontiert, die Resultate sämtlicher Schüler irgendwie einzusammeln. Einfach wäre es, am Ende der Prüfung die `~/.bash_history` von den Schülern einzusammeln. Das Tool stellt dafür zwei Skripte, ein Serverskript sowie ein Clientskript, bereit, um die `~./bash_history` mittels `netcat` über das Netzwerk einzusammeln.

## Usage
### abgabeserver.sh
`./abgabeserver.sh [start startport endport|stop]`

Die Ports können beispielsweise auf 10000 (startport) und 10020 (endport) gesetzt werden.

### abgabe
`abgabe <server> <port>`

Jedem Schüler wird ein anderer Port zugeteilt (Schüler A = 10000, Schüler B = 10001 usw...).

### auto
Das Tool kennt auch einen "auto" Modus.
Auf dem Server: `./abgabeserver.sh auto`
Auf dem Client: `./abgabe <server> auto`

Serverseitig wird damit netcat auf den Ports 10001 - 10254 gestartet. Der Client verbindet dann auf den Port, welcher dem letzten Oktett seiner lokalen IP-Adresse entspricht (beispielsweise 192.168.1.72 = Port 10072).


## Bemerkungen
- Der einfachheit halber könnte das script `abgabe` auf der LiveCD in die `$PATH` exportiert werden.
- Die Schüler müssen zwingend mit der bash arbeiten
- Es muss sichergestellt werden, dass alle Commands (vorzugsweise in der korrekten Reihenfolge) in die `~/.bash_history` geschrieben werden.
- Achtung: Wird einem Command ein Leerzeichen vorangestellt, wird dieser nicht in die `~/.bash_history` geschrieben.
