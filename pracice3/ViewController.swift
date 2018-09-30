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

    @IBOutlet weak var powerField: UITextField!
    
    @IBAction func makeAdd(_ sender: UIButton) {
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
        pawa.append(powerField.text!)
        let indexPath = IndexPath(row: nombres.count - 1, section: 0)
        _ = IndexPath(row: pawa.count - 1, section: 0)
        tabla.beginUpdates()
        tabla.insertRows(at: [indexPath], with: .automatic)
        tabla.endUpdates()
        field.text = ""
        powerField.text = ""
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
         let celda = tableView.dequeueReusableCell(withIdentifier: "celda")
        celda?.textLabel?.text = nombres[indexPath.row]
        celda?.detailTextLabel?.text = pawa[indexPath.row]

        return celda!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Hola \(nombres[indexPath.row])", message: "Go", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
