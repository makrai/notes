Florian Schiel from the IPS
# Automatische Spracherkennung, Kapitel 4: Wissenschaftliches Arbeiten

### 4.3.1. ... Aufteilung der Sprachdaten in Test-, Entwicklungs- und Trainings- Korpus

* Alle drei Korpora müssen sprecherdisjunkt sein,
* Alle drei Korpora sollten Sprache desselben Typs (spontan, gelesen), aus
  derselben Domäne und unter den selben Aufnahmebedingungen enthalten
  (Akustik, Aufnahmetechnik). Wenn z.B. der Sprachkorpus sowohl Studio- als
  auch Telefon-Sprachaufnahmen enthält, müssen diese in gleichen Proportionen
  über die drei Korpora verteilt sein.
* Trainingskorpus (training set): wird zur Abschätzung der akustischen
  Modellierung (z.B.  Training der HMM oder ANN) und zum Training des
  Sprachmodells (language models) ver- wendet. (Für die Verbesserung des
  Sprachmodells können weitere Textkorpora hinzugezogen werden.)
* Entwicklungskorpus (development set): wird als Testmaterial zur Berechnung
  des Ab- bruchkriteriums im Training und zur Einstellung von Test-Parametern
  verwendet (z.B. Ein- fluss des Sprachmodells, Pruning Faktoren etc.).
* Testkorpus
