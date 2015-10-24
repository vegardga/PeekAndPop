# Peek and Pop
3D Touch. Neste generasjon Multi-Touch. I hvert fall i følge Apple. Dette tilfører iPhone-opplevelsen en ny dimensjon av funksjonalitet. Men hvordan utnytter vi utviklere denne dimensjonen? La oss ta en kjapp titt, og kanskje et pop..

![alt text](https://bekkopen.blob.core.windows.net/attachments/c2f74585-8e01-48b7-919f-ba010a946db1 "3D Touch")

# 3D Touch
Hver gang Apple lanserer noe nytt hører vi ordene magisk, fantastisk og utrolig om igjen og om igjen. I september 2015 ble iPhone 6s/6s Plus lansert, sammen med iOS 9. Én av de nye, morsomme egenskapene til disse telefonene er 3D Touch som lar deg gjøre ting som aldri før har vært mulig. Telefonen registrerer ikke lenger bare *hvor* på skjermen du trykker, men ved hjelp av 3D Touch-teknologien registrerer den også *hvor hardt* du trykker. Dette åpner for nye, raske og enkle måter man kan bruke telefonen på.

3D Touch-teknologien har dog vært ute på markedet en stund. Både Apple Watch og styreflatene til de nye MacBook-maskinene kan skille mellom berøring og trykk, da gjennom det Apple har valgt å kalle Force Touch. Vi har altså litt erfaring med teknologien fra disse produktene, men det er først nå at den også er innebygd i iPhone. Hvorfor Apple har valgt å kalle det for 3D Touch nå, og ikke Force Touch, er uvisst.

Teknologien er unektelig interessant, og ser meget spennende ut på illustrasjonene fra Apple. Men, reklamen fra Apple er jo rettet mot forbrukere som kjøper iPhone og laster ned apps. Den sier ingen ting om hvordan vi som utviklere kan benytte oss av teknologien og hva som må til for å bruke 3D Touch i applikasjonene våre. Så la oss ta en nærmere kikk på det.

# Peek and Pop
Med 3D Touch vet altså telefonen hvor hardt man trykker på skjermen, og det gir blant annet muligheten for det Apple har valgt å kalle Peek and Pop. Kort fortalt går det ut på å forhåndsvise hva man har i vente, i tillegg til å kunne utøve handlinger hvis man også ønsker det. Dette er Peek-delen av bevegelsen. Hvis man så trykker enda hardere på skjermen hopper man, eller *popper*, rett inn i innholdet man forhåndsviste.

Peek and Pop kan forhåndsvise all slags innhold og tilby ulike handlinger basert på dette, uten å åpne noe som helst. For eksempel kan man ta en kikk på en e-post i innboksen ved å trykke lett på skjermen, uten at man åpner e-posten helt og navigerer seg bort fra resten av e-postene. Hvis man derimot ønsker å åpne e-posten etter at man har tittet på forhåndsvisningen, trykker man bare litt hardere på skjermen. Dette minker antall unødvendige kontekstbytter.

Det er som sagt ikke bare e-poster dette fungerer for. Også nettsider, bilder og kart kan forhåndsvises, bare for å nevne noen. Dette gir iPhone-opplevelsen en ny dimensjon i hvordan man bruker telefonen og navigerer rundt, og det er helt klart noe utviklere burde utnytte til det fulle.

![alt text](https://bekkopen.blob.core.windows.net/attachments/2cf08533-f7f2-4443-86f6-c55a96915bcc "Peek and Pop")

# Eksempelprosjekt
For å vise hva som må til for å bruke Peek and Pop er det like greit å ta det fra begynnelsen. Så vi starter helt enkelt med å opprette et nytt prosjekt av typen *Single View Application* i Xcode. Dette gir oss en applikasjon med en *ViewController* i Storyboardet og tilhørende kildekode.

![alt text](https://bekkopen.blob.core.windows.net/attachments/f9e23077-1a9e-40ef-84d4-a56ff53ecb3f "Opprettelse av nytt prosjekt i Xcode")

Peek and Pop er fint å vise gjennom en tabell, så vi bytter ut nevnte ViewController med en *TableViewController*. I eksempelprosjektet valgte jeg å kalle kontrolleren for **MainTableViewController**.

![alt text](https://bekkopen.blob.core.windows.net/attachments/a73b3117-c791-4a86-915c-f69217c762c8 "Storyboard med NavigationController og TableViewController")

MainTableViewController inneholder foreløpig ingen spesielle funksjoner eller oppsett. Kildekoden nedenfor burde være kjent for de fleste som har prøvd seg på TableViewController.

```swift
//
//  MainTableViewController.swift
//

import UIKit

class MainTableViewController: UITableViewController {
    
    struct Asset {
        let title: String
    }
    
    let items = [
        Asset(title: "Triangle"),
        Asset(title: "Circle"),
        Asset(title: "Rectangle"),
        Asset(title: "Little house")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let asset: Asset = items[indexPath.row]
        cell.textLabel!.text = asset.title
        return cell
    }

}
```

Det er lagt til en struct kalt **Asset**, og så lages det en liste med fire enkle Asset-elementer.

```swift
struct Asset {
    let title: String
}

let items = [
    Asset(title: "Triangle"),
    Asset(title: "Circle"),
    Asset(title: "Rectangle"),
    Asset(title: "Little house")
]
```

Da det ikke er så veldig mange elementer i listen holder det med én seksjon i tabellen. Det er selvfølgelig ingen hindring om man vil ha flere seksjoner i tabellen, men for enkelhetsskyld holder vi oss til én denne gangen.

```swift
override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}
```

Antall elementer som skal listes ut i tabellen er det samme som antall elementer i variabelen ```items```.

```swift
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}
```

Det siste som gjøres er å sette opp hver enkelt rad i tabellen med riktig innhold. Akkurat nå trenger vi bare å ta hensyn til en enkel tittel, så vi setter tittelen til hver rad lik tilhørende tittel i ```items```.

```swift
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    let asset: Asset = items[indexPath.row]
    cell.textLabel!.text = asset.title
    return cell
}
```

# Segue til detaljvisning
En applikasjon som kun inneholder en enkel liste er ikke særlig interessant, så for å få litt mer interaksjon legges det til en detaljvisning for elementene i listen. Dette gjøres ved å legge inn en ny ViewController i Storyboardet, kalt **ImageViewController**, som tar for seg detaljvisningen av en enkel Asset.

![alt text](https://bekkopen.blob.core.windows.net/attachments/029c8184-e2b9-4457-9489-973e320ab9c7 "Storyboard med ImageViewController")

I Storyboardet ble drag-and-drop brukt for å lage en *segue* fra **MainTableViewController** til **ImageViewController**. Segue kan kanskje oversettes til *overgang* på norsk, da det brukes for å beskrive overgangen mellom ulike visninger. Dette gjøres ved å holde inne ```ctrl```, klikke og holde inne musepekeren fra der man ønsker at seguen skal starte og deretter dra peker over og slippe opp på ønsket destinasjon. Illustrasjonen under forsøker å vise dette i praksis.

![alt text](https://bekkopen.blob.core.windows.net/attachments/d94bc4c6-bdf9-4f21-aaad-30b16e4a560d "Opprettelse av segue i Storyboard")

Når man så slipper opp musepekeren på ønsket ViewController kan man velge hvilken type segue man vil ha. I dette eksempelet velges **Show**, som er det samme som en **Push**. Denne typen segue er veldig vanlig i listevisninger, og det som skjer er at neste visning dyttes inn fra høyre.

![alt text](https://bekkopen.blob.core.windows.net/attachments/8c4c8008-b781-4079-b68e-ac89fff1744e "Velger Push-segue blant alternativene")

Det er ikke noe i veien for å ha flere segue fra samme ViewController, men da burde man kunne identifisere disse i kildekoden gjennom unike identifikatorer. Seguen i dette eksempelet fikk identifikatoren *Show Image*, for å nettopp kunne verifisere riktig segue i koden. Kildekode og Storyboard er løst koblet (loose coupling) i Swift og Xcode, noe som har sine fordeler og ulemper.

Det er litt kjedelig med bare tekst i en applikasjon, så jeg tillot meg selv å lage noen flotte bilder som kan bli vist gjennom detaljvisningen ImageViewController. Structen Asset ble også utvidet for å inkludere bildelenke og beskrivelse.

```swift
struct Asset {
    let title: String
    let img: String
    let desc: String
}

let items = [
    Asset(title: "Triangle", img: "triangle", desc: "A polygon with three edges and three vertices"),
    Asset(title: "Circle", img: "circle", desc: "A simple shape in Euclidean geometry"),
    Asset(title: "Rectangle", img: "rectangle", desc: "Any quadrilateral with four right angles"),
    Asset(title: "Little house", img: "house", desc: "Little House on the Prairie?")
]
```

I tillegg ble metoden ```prepageForSegue``` lagt til i **MainTableViewController**. I denne metoden sjekker man at det faktisk er seguen med identifikatoren "Show Image" som blir kalt, og finner ut hvilken rad som ble trykt på gjennom ```tableView.indexPathForSelectedRow```. Metoden brukes for å klargjøre destinasjonskontrolleren, i dette tilfellet ImageViewController.

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "Show Image", let indexPath = tableView.indexPathForSelectedRow {
        let asset = items[indexPath.row]
        let detailViewController = segue.destinationViewController as! ImageViewController
        
        detailViewController.title = asset.title
        detailViewController.img = UIImage(named: asset.img)
        detailViewController.text = asset.desc
    }
}
```

ImageViewController inneholder ikke noe mer enn det absolutt nødvendige, og forklares bedre gjennom kode enn ord.

```swift
//
//  ImageViewController.swift
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var img: UIImage?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = img
        myLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
```

To referanser til grafiske elementer i kontrolleren, markert med ```IBOutlet```, som refererer til bildet og teksten i visningen. Slike referanser lager man på samme måte som segue i Storyboard, ved å holde inne ```ctrl``` og deretter dra en kobling fra elementet i Storyboardet inn i kildekoden.

```swift
@IBOutlet weak var myImageView: UIImageView!
@IBOutlet weak var myLabel: UILabel!
```

I tillegg til disse har klassen to variabler i ```img``` og ```text```, som settes i ```prepareForSegue``` i **MainTableViewController**. 

```swift
var img: UIImage?
var text: String?
```

Verken ```myImageView``` eller ```myLabel``` er initialisert i ```prepareForSegue```, de blir først opprettet i metoden ```viewDidLoad``` som blir kalt når kontrolleren faktisk vises på skjermen. Derfor kan det være lurt å ha egne variabler som kan settes av andre objekter før visningen av en ViewController.

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    myImageView.image = img
    myLabel.text = text
}
```

Hvis vi tester applikasjonen og det vi har gjort til nå vil den gi oss en liste med fire elementer som startside, samt en detaljvisning med bilde og tekst hvis man trykker på noen av disse elementene.

![alt text](https://bekkopen.blob.core.windows.net/attachments/c14644bb-4d2b-4c07-ae89-f4d2109162a3 "Tabellvisning med navigering")

# UIViewControllerPreviewingDelegate
For å få Peek and Pop-funksjonalitet i en applikasjonen er det *UIViewControllerPreviewingDelegate* som er trikset. UIViewControllerPreviewingDelegate krever det at man implementerer følgende to metoder.
+ *previewingContext:viewControllerForLocation:*
+ *previewingContext:commitViewController:*

I tillegg kan det være lurt å sjekke om telefonen som applikasjonen kjører på *faktisk* støtter 3D Touch. Funksjonaliteten man tilbyr gjennom 3D Touch kan gjøres tilgjengelig for eldre telefoner ved hjelp av f.eks. [UILongPressGestureRecognizer](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UILongPressGestureRecognizer_Class/index.html), men dette må jo da selvsagt også implementeres. En fin plass å se om telefonen støtter 3D Touch er i metoden ```viewDidLoad``` i **MainTableViewController**.

```swift
if traitCollection.forceTouchCapability == .Available {
    registerForPreviewingWithDelegate(self, sourceView: view)
}
else {
    // do something else
    alertController = UIAlertController(title: "3D-Touch not available", message: "Unsupported device.", preferredStyle: .Alert)
}
```

I dette tilfellet vises en *UIAlertController* hvis telefonen ikke støtter 3D Touch, som vist i illustrasjonen under.

![alt text](https://bekkopen.blob.core.windows.net/attachments/40873d14-f7bc-4f55-9bf5-67ca2a500b2e "Feilmeldingen med teksten Unsupported device")

Men, skulle man være så heldig å ha 3D Touch vil metoden ```registerForPreviewingWithDelegate``` bli utført, og telefonen bekrefter at Peek and Pop er tilgjengelig og kan brukes. *UIViewControllerPreviewingDelegate* kan være fin å legge i en *extension*, for å skille på standardfunksjonalitet som fungerer for alle telefoner og 3D Touch-funksjonalitet for nyere telefoner som støtter dette. Det ble derfor opprettet en ny fil kalt **MainTableViewController+UIViewControllerPreviewingDelegate.swift** som implementerer de to nevnte metodene ovenfor.

```swift
//
//  MainTableViewController+UIViewControllerPreviewingDelegate.swift
//

import UIKit

extension MainTableViewController: UIViewControllerPreviewingDelegate {
    
    // MARK: UIViewControllerPreviewingDelegate
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRowAtPoint(location),
            cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }
        
        guard let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("ImageViewController") as? ImageViewController else { return nil }
        
        let asset = items[indexPath.row]
        detailViewController.title = asset.title
        detailViewController.img = UIImage(named: asset.img)
        detailViewController.text = asset.desc
        
        previewingContext.sourceRect = cell.frame
        
        return detailViewController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
    
}
```

Først er det metoden ```previewingContext:viewControllerForLocation:``` som blir implementert. Det første som skjer i denne metoden er å finne hvilken indeks og rad som ble trykt på i tabellen.

```swift
guard let indexPath = tableView.indexPathForRowAtPoint(location),
    cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }
```

```guard``` er kanskje nytt for noen. Det er et nytt nøkkelord i Swift 2.0, og brukes for å slippe den krøkkete if-let-runddansen. I stedet for utallige ```if let object = value { ... }```, så kan man bruke ```guard``` og sjekke alle variablene man er interessert i. Hvis noen av disse skulle vise seg å ikke være det man tror, så hopper man til else-blokken og utfører det som står der.

```swift
if let indexPath = tableView.indexPathForRowAtPoint(location) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
        // do something
    }
}

// The code above is the same as the code below

guard let indexPath = tableView.indexPathForRowAtPoint(location),
    cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }
// do something
```

Dette liker vi. Lettere å lese, lettere å skrive. Win-win!

Det neste som skjer i ```previewingContext:viewControllerForLocation:``` er at det opprettes en ny instans av **ImageViewController**, og deretter oppdateres variablene på samme måte som i ```prepareForSegue```.

```swift
guard let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("ImageViewController") as? ImageViewController else { return nil }
        
let asset = items[indexPath.row]
detailViewController.title = asset.title
detailViewController.img = UIImage(named: asset.img)
detailViewController.text = asset.desc
```

Til slutt oppdaterer vi størrelsen på forhåndsvisningen for å få en fin blur-effekt i bakgrunnen, og returner den nylig opprettede kontrolleren.

```swift
previewingContext.sourceRect = cell.frame    
return detailViewController
```

Den andre metoden som måtte implementeres, ```previewingContext:commitViewController:```, gjør ikke annet enn å åpne kontrolleren som vanlig hvis brukeren trykker enda hardere på skjermen. Altså Pop-delen i Peek and Pop.

```swift
func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
    showViewController(viewControllerToCommit, sender: self)
}
```

That's it. Det er faktisk ikke mer som skal til for å utnytte Peek and Pop i applikasjonen sin.

![alt text](https://bekkopen.blob.core.windows.net/attachments/1e3118c1-6547-4b50-a385-2892b5efdf35 "Peek and Pop")

# Preview Actions
Peek and Pop har også muligheter for å vise brukeren noen valg ved en Peek. Disse får man frem ved å skyve forhåndsvisningen oppover, til høyre eller til venstre på skjermen. Hvilke valg man vil tillate legges inn i ViewControlleren som vises i Peek'en. Her burde man selvsagt tenke litt over hva man vil tilby av funksjonalitet, og da begrense seg til det absolutt nødvendige.

```swift
lazy var previewActions: [UIPreviewActionItem] = {
    func previewActionForTitle(title: String, style: UIPreviewActionStyle = .Default) -> UIPreviewAction {
        return UIPreviewAction(title: title, style: style) { previewAction, viewController in
            guard let detailViewController = viewController as? ImageViewController,
                desc = detailViewController.text else { return }
            
            print("\(previewAction.title) triggered from `ImageViewController` with description: \(desc)")
        }
    }
    
    let action1 = previewActionForTitle("Default Action")
    let action2 = previewActionForTitle("Destructive Action", style: .Destructive)
    
    return [action1, action2]
    }()

override func previewActionItems() -> [UIPreviewActionItem] {
    return previewActions
}
```

I likhet med ```guard``` er det ikke sikkert at ```lazy``` er blitt ordentlig etablert enda. Ved å bruke ```lazy``` blir ikke verdien av variabelen satt før man faktisk behøver den. Det kan jo være at brukeren aldri sveiper oppover på skjermen og da heller aldri har behovet for disse valgene. I så fall er det unødvendig å initialisere ```previewActions```, og bruken av ```lazy``` kommer virkelig til sin rette.

```previewActions``` blir som sagt initialisert ved behov. I dette eksempelet blir det opprettet en liste med to ulike valg, og hvis man trykker på et av disse valgene blir det skrevet ut en setning i Xcode-konsollen med informasjon om valgt handling.

![alt text](https://bekkopen.blob.core.windows.net/attachments/22be531e-bcfc-4978-8c83-c617dfa0a365 "Peek and Pop, med preview actions")

Dette gir følgende kildekode for en oppdatert **ImageViewController** med *UIPreviewActionItem*-valg.

```swift
//
//  ImageViewController.swift
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var img: UIImage?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = img
        myLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Preview actions
    
    lazy var previewActions: [UIPreviewActionItem] = {
        func previewActionForTitle(title: String, style: UIPreviewActionStyle = .Default) -> UIPreviewAction {
            return UIPreviewAction(title: title, style: style) { previewAction, viewController in
                guard let detailViewController = viewController as? ImageViewController,
                    desc = detailViewController.text else { return }
                
                print("\(previewAction.title) triggered from `ImageViewController` with description: \(desc)")
            }
        }
        
        let action1 = previewActionForTitle("Default Action")
        let action2 = previewActionForTitle("Destructive Action", style: .Destructive)
        
        return [action1, action2]
        }()
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        return previewActions
    }

}
```

# En spennende tid i vente
Apple lanserer stadig nye produkter med nye funksjoner, noen bedre og mer interessante enn andre. 3D Touch, og da også Peek and Pop, er noe av det mer spennende jeg personlig har sett den siste tiden fra Apple. Det at skjermen kan merke hvor hardt man trykker er intet annet enn fascinerende. Jeg gleder meg til å se hva du lager og bruker dette til!

Kildekoden til eksempelprosjekt brukt i denne gjennomgangen ligger ute på github.
[https://github.com/vegardga/PeekAndPop](https://github.com/vegardga/PeekAndPop)