---
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('../../images/hero-background.jpg')
marp: true
---
![bg left:50% contain](../images/logo.jpg)
  
# Mobile App Testing

---
### Agenda
* Überblick App Testframeworks
* Robot Framework und App Testing
* Mobile Testing Setup
* Teststruktur
* Demo
* Fazit

---
### App Test Frameworks

| | Android | iOS ||
|--|--|--|--|
|Espresso|:white_check_mark:|:x:|Grey Box Testing, Android Studio Integration|
|Earl Grey|:x:|:white_check_mark:|Grey Box Testing|
|XCUITest|:x:|:white_check_mark:|Black Box Testing, XCode Integration|
|Appium|:white_check_mark:|:white_check_mark:|Black Box Testing|


<!--
- nicht vollständig, häufig verwendete
- Appium
  - gerade für Cross Platform Anwendungen interessant
  - Selenium basiert, Tests können in diversen Sprachen geschrieben werden
-->

---
### Unterschiede der Test Frameworks

* Black Box Testing vs Grey Box Testing
* Integration in die Entwicklungsumgebung
* Single vs Cross Platform
* Performance
  * Espresso und XCUITest performanter als Appium 


<!--
- Black testet die Anwendung von außen
- Grey kennt Implementierungs Details
  - z.B. Android Test APK
  - Asynchrone Operationen (Server, Animationen) können so besser behandelt werden
- Cross Platform: Ein Test für beide Platformen nicht immer möglich, z.B. unterschiedliche Komponenten, UX Patterns
- Performance => Architektur bedingt
-->

---
### Mobile App Testing mit dem Robot Framework
* Libraries auf Basis von Calabash (werden nicht mehr gepflegt)
* Appium Libray

<!--
- 2015? letzter Commit
- Calabash mittels Cucumber => Behavior-Driven-Development, Tests in natürlicher Sprache
-->

---
### Appium

![bg contain](../images/appium.jpg)


<!--
- JSON Wire Protocol (Selenium)
- echte Devices und Simulatoren
- Support für Cross Platform Testing
- Komplexeres Setup, mehr mögliche Fehlerquellen
-->

---
### Setup
* Robot Framework Dependencies... 
* Appium Server
* Appium Desktop App
* Android SDK, Emulatoren (Android Studio)
* XCode, iOS Simulatoren

<!--
- Appium Server über npm -> Node Package Manager, brew
- Desktop App -> Appium Webseite
- Android Studio -> Emulator Images
-->

---
### Teststruktur
```base.robot```
```
*** Settings ***
Library  AppiumLibrary
Library  BuiltIn

...

Open iOS Test App
  open application  http://127.0.0.1:4723/wd/hub  automationName=XCUITest
  ...  app=${IOS_APP}  platformName=iOS  platformVersion=13.5
  ...  deviceName=iPhone 8
  ```
<!--
- URL Appium Server
- Apppium Driver -> zur Steuerung des Devices
- Pfad zur App
- ...

 -->

---
### Wie können Elemente selektiert wird
|Locator|Beispiel|
|--|--|
|```accessibility_id```|```Click Element accessibility_id=send_btn```|
|```iOS Predicate```|```Click Element nsp=type=="XCUIElementTypePicker"```|
|```class```|```Click Element  class=UIAPickerWheel```|
|```xpath```|```Click Element  xpath=//UIATableView/UIATableCell/UIAButton```|

([Locator Übersicht](http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Introduction))

<!-- 
- Accessibility ID/Label wird häufig als TestID verwendet
- iOS Predicate: Type aber auch nur/zusätzlich Eigenschaften z.B. Visible
- Klassen, xpath
- Optimal: Accessiblity ID
-->


---
### Hilfsmittel für die Wahl des Locators

![w:1000 center](../images/appium_desktop.png)

<!-- 
- Code steht zur Vefügung => TestIDs
- Gerade im Cross Platform Kontext evtl. nicht immer Zugriff auf Klasse
  - Dann alternativ Lösung über Appium Desktop
  - geht auch über die UI Inspectors der IDEs
-->

---

### Interaktion mit der App
```
Click Element accessibility_id=send_btn
Input Text accessibility_id=form_input
Hide Keyboard
Page Should Contain Text Any text..
Scroll Down accessibility_id=any_element
Swipe start_x start_y offset_x offset_y duration
...
```
[Keywords](http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html)

---
### Demo
...

<!--
 - App vorstellen
 - Test Android -> android_exmample.robot
 - Test iOS -> ios_emission.robot
 - ios_budget.robot
   - Swipe Optionen
 - Failing Test und Test Results + Screenshot -> ios_fail
-->

---

### Fazit

<!--
- mir gefällt die Art Tests zu schreiben
- fehlende Erfahrung
- häufiger Probleme mit dem Appium Server => sehr langsam oder es geht gar nicht -> Neustart hilft
- Warten auf Elemente.. Gerade Android Emulator problematisch
- evtl. CI Integration
  - Emulatore/Simulatoren können Headless gestartet werden
  - für iOS wird natürlich ein Mac benötigt
  - durch Appium sollte auch Anbindung an Cloud Platformen wie Browserstack möglich sein 
 -->