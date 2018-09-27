//
//  ViewController.swift
//  pracice3
//
//  Created by L102-Maestro on 14/09/18.
//  Copyright © 2018 Universidad de Guadalajara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var nombres = ["Dor", "Kan", "Zin", "Ein"]
    var pawa = ["fire", "wind", "water", "earth"]

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var tabla: UITableView!

    @IBOutlet weak var addButtoner: UIButton!
    @IBAction func performAdd (_sender: AnyObject){
       clicktoAdd()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.dataSource = self
        tabla.delegate = self
        let tap = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard) )
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard(){
        view.endEditing(true)
    }


    func clicktoAdd ()
   {
        nombres.append(field.text!)
        let indexPath = IndexPath(row: nombres.count - 1, section: 0)
        tabla.beginUpdates()
        tabla.insertRows(at: [indexPath], with: .automatic)
        tabla.endUpdates()

        field.text = ""
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsintableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! celda

        celda?.textLabel?.text = nombres[indexPath.row]
        celda?.detailTextLabel?.text = pawa[indexPath.row]

        return celda
    }

}
