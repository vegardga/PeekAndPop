# PeekAndPop
How to include peek-and-pop from iPhones with 3D-touch and iOS 9 in your app

```
Norwegian: 
The tutorial will only be written in Norwegian, sorry about that.
```

# Peek and Pop


# 3D Touch
iPhone 6S/6S Plus ble nylig sluppet av Apple, i tillegg til det oppdaterte operativsystemet iOS 9. Én av de nye morsomme egenskapene til disse nye telefonene er 3D Touch, en helt ny måte å interagere med telefonen på. Dette gir en helt ny dimensjon i måten vi bruker telefonen på, da den nå vet hvor hardt vi trykker på skjermen.

Force Touch kom med Apple Watch, så det har vært ute i verden en stund. 

# Peek and Pop
Med 3D Touch vet telefonen hvor hardt man trykker på skjermen, og det gir muligheten for det Apple har valgt å kalle Peek and Pop. Kort fortalt går det ut på å vise et utsnitt/utdrag av hva man har i vente, i tillegg til å utøve handler hvis man også ønsker det (Peek). Hvis man trykker enda hardere på skjermen spretter man rett inn i innholdet (Pop). 

# Start et nytt prosjekt
Vi starter helt enkelt, med å opprette et nytt prosjekt av typen *Single View Application*. 
![alt text](https://<bilde-url>.png "Skjermdump av Single View Application")

Peek and Pop er fint å vise gjennom en tabell, så vi bytter ut *ViewControlleren* med en *TableViewController*. I prosjektet valgte jeg å kalle kontrolleren for **MainTableViewController.swift**.
![alt text](https://<bilde-url>.png "Skjermdump av Storyboard med NavigationController og TableViewController")

**MainTableViewController** inneholder foreløpig ingen spesielle funksjoner eller oppsett. Det eneste som er lagt til er en Struct, kalt *Asset*, for å holde på noen enkle objekter, og så lages det en liste over fire enkle *Assets*. Oppsettet og koden her burde være kjent for de fleste som har laget noen TableViewControllere i sitt liv.

```swift
//
//  MainTableViewController.swift
//

import UIKit

class MainTableViewController: UITableViewController {
    
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

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Show Image", let indexPath = tableView.indexPathForSelectedRow {
            let asset = items[indexPath.row]
            let detailViewController = segue.destinationViewController as! ImageViewController
            
            detailViewController.title = asset.title
            detailViewController.img = UIImage(named: asset.img)
            detailViewController.text = asset.desc
        }
    }

}
```