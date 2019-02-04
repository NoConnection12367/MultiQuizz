<h1>Dokumentation Multiquizz</h1>
<h3>App Programmierung WS 2018/19 - Dominik Flierl, Moritz Prüfling</h3>

<br>

**Inhaltsverzeichnis**
1. Einleitung
1. Benutzerführung
   1. Login
   1. Hauptmenü
      1. Offene Spiele
      1. Beendete Spiele
      1. Weitere Funktionen
   1.	Neues Spiel starten
   1.	Quizseite
   1.	Spielübersicht
   1.	Statistiken
   1.	Freundesliste
1. Technologien und Codeaufbau
   1.	Verwendete Technologien
   1. Grundaufbau
      1. Klassen
      1. Seiten
      1. Weitere Dateien und Pakete


<h3>1. Einleitung</h3>
<p>Als Thema für die Studienarbeit haben wir uns für eine Quizz App entschieden, bei der die Benutzer gegeneinander spielen können. Nutzer können dabei anhand des Nutzernamens zur Freundesliste hinzugefügt werden und daraufhin gegeneinander antreten.  Jedes Quiz beinhaltet zehn aufeinanderfolgende Fragen aus verschiedenen Kategorien. Hat der Ersteller des Spiels alle zehn Fragen beantwortet, kann der herausgeforderte Spieler antreten. Derjenige mit den meisten richtig beantworteten Fragen gewinnt.</p>
<p>Die App ist dabei vollständig echtzeitfähig, da alle Daten über die Realtime Datenbank Firebase verwaltet werden. Auf den einzelnen Smartphones befinden sich dadurch keine Daten, alles ist Cloud-Synchronisiert.</p>
<p>Den Datensatz für die Quizfragen haben wir von Open Trivia Database (https://opentdb.com/) übernommen und als JSON in unsere Datenbank hochgeladen. Da die Fragen nur in englischer Sprache verfügbar sind, haben wir uns dazu entschieden, die gesamte App in Englisch zu halten, um ein einheitliches Gesamtbild zu schaffen.
</p>

<h3>2. Benutzerführung</h3>
<h4>2.1 Login</h4>
<img src="/Screenshots/Screenshot_login_wrong.png" width="130" align="right">
<img src="/Screenshots/Screenshot_login.png" width="130" align="right">
<p>Direkt nach dem Start der App wird der Login Bildschirm angezeigt. Hier muss sich der Benutzer zunächst mit seinem Benutzernamen und Passwort anmelden. Bei einem Klick auf Login wird überprüft, ob der eingegebene Benutzername und das zugehörige Passwort in der Datenbank vorhanden sind.</p>
<p>Die Passwörter werden hierbei als Hash gespeichert und übertragen, um die Passwörter vor Hacking Angriffen zu schützen. Als Hashfunktion kommt die derzeit sichere Funktion SHA-256 zum Einsatz.</p>
<p>Ist die Kombination aus Benutzername und Passwort fehlerhaft, wird dies dem Benutzer durch Rotfärbung der Eingaben angezeigt.
Stimmen Nutzername und Passwort überein, wird der Benutzer ins Hauptmenü der App weitergeleitet.</p>

<h4>2.2 Hauptmenü</h4>
<img src="/Screenshots/Screenshot_mainmenu.png" width="190" align="right">
<h5>2.2.1 Offene Spiele</h5>
<p>Im Hauptmenü wird dem Benutzer zunächst eine Liste der noch offenen Spiele angezeigt. Hier sind alle Spiele aufgelistet, die andere Spieler gestartet haben, und bei denen der Benutzer noch Fragen beantworten muss. Dabei wird zu jedem Spiel eine Liste der Mitspieler, sowie Zeit und Datum der Spielerstellung angezeigt. Mit einem Klick auf eines der gelisteten Spiele kann der Benutzer das Spiel starten.
</p>

<h5>2.2.2 Beendete Spiele</h5>
<p>Weiter unten wird außerdem eine Liste mit fertig gestellten Spielen angezeigt. Hier werden alle Spiele aufgelistet, die bereits beendet sind, und an denen der Benutzer beteiligt war. So können auf einen Blick alle vorhandenen Spiele noch einmal eingesehen werden. Mit einem Klick auf eines der vergangenen Spiele wird die dazugehörige Spielübersicht mit weiteren Details angezeigt (siehe auch Punkt 2.5)</p>

<h5>2.2.3 Weitere Funktionen</h5>
<p>Am unteren Rand des Bildschirms werden drei Schaltflächen angezeigt:</p>

* Start new game: Leitet den Benutzer zu einer neuen Seite weiter, auf der anschließend ein neues Spiel erstellt werden kann
* Statistics: Zeigt eine Seite mit den bisherigen Statistiken des Spielers an
* Friendslist: Zeigt die Freundesliste des Spielers an

<h4>2.3 Neues Spiel starten</h4>
<img src="/Screenshots/Screenshot_new_game.png" width="150" align="right">
<p>Um ein neues Spiel starten zu können, muss der Spieler zuerst einen Gegenspieler auswählen. Dazu hat er zwei Möglichkeiten:</p>

* Am oberen Ende der Seite wird die Schaltfläche „Random Player“ angezeigt. So kann der Nutzer einfach ein Spiel gegen einen zufälligen Spieler starten. 
* Alternativ wird weiter unten die aktuelle Freundesliste des Spielers angezeigt. Mit einem Klick auf den jeweiligen Freund wird ein neues Spiel gegen denjenigen erstellt.

<p>Nach der Auswahl wird der Nutzer zuerst noch zu einer Bestätigungsseite weitergeleitet, auf der er nochmals bestätigen muss, dass das Spiel gestartet werden soll. Dies soll verhindern, dass versehentlich Spiele gestartet werden. Mit einem Klick auf den „Start Game“ Button wird das Spiel gestartet und die erste Frage angezeigt.</p>


<h4>2.4 Quizseite</h4>
<p>Auf dieser Seite werden die zu beantwortenden Fragen angezeigt. Jedes Spiel beinhaltet zehn Fragen, die nacheinander beantwortet werden müssen.</p>
<p>In der oberen Hälfte des Bildschirms wird die zu beantwortende Frage angezeigt. Darunter befindet sich ein Countdown, der beginnend von 30 Sekunden heruntergezählt wird. Erreicht der Timer den Wert 0, gilt die aktuelle Frage automatisch als falsch beantwortet, und der Spieler kann zur nächsten Frage wechseln.</p>
<p>Im unteren Teil der Seite befinden sich vier Kacheln mit den jeweiligen Antwortmöglichkeiten. Der Spieler kann die vermeintlich richtige Antwort per Klick auswählen. Ist die Antwort korrekt, wird das jeweilige Feld grün gefärbt. Bei einer Falschantwort wird das ausgewählte Feld rot hinterlegt, zusätzlich wird durch Grünfärbung die richtige Antwort gezeigt.</p>
<p>Mit einem Klick auf den Fragentext wird mit der nächsten Frage fortgefahren.</p>
<img src="/Screenshots/Screenshot_question.png" width="190" align="left">
<img src="/Screenshots/Screenshot_question_right.png" width="190" align="left">
<img src="/Screenshots/Screenshot_question_wrong.png" width="190" align="left">
<img src="/Screenshots/Screenshot_question_overtime.png" width="190">

<h4>2.5 Spielübersicht</h4>
<p>Auf dieser Seite werden genauere Details zum ausgewählten Spiel angezeigt. </p>
<p>Im oberen Teil der Seite wird sofort symbolisch der aktuelle Zustand des Spiels dargestellt. Hierbei gibt es vier verschiedene Status:</p>

* Win (grün): Zeigt an, dass der Benutzer dieses Spiel gewonnen hat
* Lost (rot): Zeigt an, dass der Benutzer dieses Spiel verloren hat
* Draw (blau): Zeigt an, dass dieses Spiel unentschieden ausgegangen ist
* Pending (blau): Zeigt an, dass der Gegenspieler noch nicht gespielt hat

<p>Weiter unten wird dann angezeigt, wie viele Punkte die beteiligten Spieler jeweils erzielt haben.
Per Klick auf den Button „Back to main menu“ wird wieder zum Hauptmenü gewechselt.</p>
<img src="/Screenshots/Screenshot_win.png" width="190" align="left">
<img src="/Screenshots/Screenshot_draw.png" width="190" align="left">
<img src="/Screenshots/Screenshot_lost.png" width="190" align="left">
<img src="/Screenshots/Screenshot_pending.png" width="190">

<img src="/Screenshots/Screenshot_stats.png" width="150" align="right">
<h4>2.6 Statistiken</h4>
<p>Hier werden Statistiken über alle bereits abgeschlossenen Spiele des Spielers dargestellt. </p>
<p>Im oberen Bereich werden die Anzahlen aller bereits gewonnener und verlorener Spiele angezeigt. Darunter sind noch weitere interessante Statistiken aufgelistet, die da wären:</p>

* Gesamtzahl aller gespielten Spiele
* Anzahl der Spiele, die unentschieden ausgegangen sind
* Anzahl aller richtig beantworteten Fragen
* Trefferquote richtiger Antworten

<br>
<h4>2.7 Freundesliste</h4>
<p>Auf dieser Seite werden alle bereits hinzugefügten Freunde angezeigt. Soll ein neuer Freund hinzugefügt werden, kann das über die Textbox am unteren Rand des Bildschirms gemacht werden. Dazu muss lediglich der Benutzername des hinzuzufügenden Spielers eingegeben werden. Mit einem Klick auf den „+“ Button wird der Spieler hinzugefügt und in der Liste angezeigt. Sollte es zu einem Fehler kommen (z.B. Benutzer existiert nicht oder wurde bereits hinzugefügt), so wird dies dem Benutzer direkt angezeigt.</p>
<p>Die Freundesliste spielt außerdem beim Starten eines neuen Spiels eine Rolle. Hier hat man neben einem zufälligen Spiel die Möglichkeit, gegen einen bereits hinzugefügten Freund zu spielen, was den Spielspaß deutlich anhebt.</p>





<h3>3. Technologien und Codeaufbau</h3>

<h4>3.1 Verwendete Technologien</h4>
<p>Zur Programmierung der App wurde Flutter verwendet. Wurden alle Oberflächen mit Flutter gestaltet, der Hintergrundcode wurde ausschließlich in Dart implementiert. Während der Entwicklung haben wir besonderen Wert auf objektorientierte Programmierung, sowie eine übersichtliche und gut strukturierte Projektstruktur gelegt.</p>
<p>Die Anwendung ist nur mit einer aktiven Internetverbindung möglich, da alle Appdaten in der Online-Datenbank Firebase gespeichert werden. Dies umfasst neben den Benutzern auch die einzelnen Spiele, Quizfragen, Statistiken, sowie die Freundschaftsverlinkungen. Alle Datenbankzugriffe sind zusätzlich asynchron gestaltet, um die Userexperience nicht durch lange Ladezeiten zu mindern. </p>
<p>Zur Entwicklung der App haben wir Visual Code verwendet, das Flutter lückenlos unterstützt. Die eigentliche Entwicklung fand mithilfe der eingebauten Android Emulatoren statt, nach der Fertigstellung wurde die App allerdings auch auf verschiedenen physikalischen Geräten getestet. Da alle Screens responsive gestaltet wurden, ist die App auf allen aktuellen Geräten lauffähig, unabhängig von der Bildschirmgröße.</p>
<p>Um das Projektmanagement und Codemanagement zu vereinfachen, wurde ein privates GitHub Repository verwendet. So können alle Änderungen leicht dokumentiert werden, und Fehler können einfach bis zu deren Entstehung zurückverfolgt werden. </p>


<h4>3.2 Grundaufbau</h4>
<img src="/Screenshots/Screenshot_file_tree.png" width="210" align="right">
<p>Der Großteil des Codes befindet sich im „lib“ – Ordner des Projekts. Hier ist der Code nochmals in weitere Unterordner aufgeteilt, um eine übersichtliche Projektstruktur zu erhalten, und auch zukünftige Änderungen einfach zu gestalten. </p>

<h5>3.2.1 Klassen</h5>
<p>Im Ordner „Classes“ befinden sich zusätzliche Klassen, die für die Entwicklung benötigt wurden und meist Datenbankobjekte darstellen. Diese Klassen enthalten den Großteil des in Dart implementierten Hintergrundcodes. Dazu gehören neben den Spielen auch die Nutzer, die Fragen und die Statistiken. Die Klassen stellen jeweils zusätzlich noch Funktionen zur Verfügung, die geänderte Daten direkt in die Datenbank speichern bzw. auf Daten in der Datenbank zugreifen. So kann z.B. global die Methode User.getUser(ID) aufgerufen werden, die dann den Nutzer mit der angegebenen ID liefert. Durch diese Vorgehensweise konnten wir Codeduplizierungen verhindern und so die zukünftige Wartbarkeit deutlich verbessern. Selbiges trifft auch auf die anderen Klassen zu.</p>

<h5>3.2.2 Seiten</h5>
<p>Im Ordner „Pages“ liegen die Dateien für die jeweiligen Screens. Dabei wurde für jeden Screen eine eigene Datei angelegt, was wiederum der Codestruktur zu Gute kommt. Die insgesamt neun voneinander unabhängigen Seiten enthalten neben zusätzlichem Hintergrundcode vor allem den in Flutter implementierten Oberflächencode. Auch hier haben wir versucht, nicht einfach jeglichen Code in die Build-Funktion zu schieben, sondern mit mehreren Funktionen eine übersichtlichere Struktur zu erzeugen. </p>

<h5>3.2.3 Weitere Dateien und Pakete</h5>
<p>Die Datei globals.dart enthält Daten, auf die global zugegriffen werden muss. Dazu gehört beispielsweise der aktuell eingeloggte Nutzer.</p>
<p>Zuletzt enthält die Datei main.dart noch den Code zum Starten der Anwendung und die Routing-Daten. Mit Hilfe der Routing Daten kann der Navigationsstack zurückgesetzt werden, um den Nutzer beispielsweise am zurückgehen zu hindern. In unserem Fall ist das v.a. bei den Fragen nötig, da sonst einfach vergangene Fragen erneut beantwortet werden könnten.</p>
<p>In der Datei pubspec.yaml sind die einzelnen von uns verwendeten Zusatzpakete aufgelistet und eingebunden. Dazu gehören:</p>

* firebase_database: ^1.0.3: Stellt die Grundfunktionalität zur Verbindung mit Firebase zur Verfügung.
* html_unescape: ^1.0.1+2: Stellt eine Funktion bereit, um speziell Codierte Zeichen im Fragentext aufzulösen (z.B. „&lt;“)
* crypto: any: Stellt die Hashfunktion SHA256 zur Verfügung, um die Passworter sicher speichern zu können


