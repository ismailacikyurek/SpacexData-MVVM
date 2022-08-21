//
//  ViewController.swift
//  spacexData
//
//  Created by İSMAİL AÇIKYÜREK on 26.07.2022.
//

import UIKit
import Alamofire
import Kingfisher

class SpacexDataViewController: UIViewController {
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var filtre : [SpacexDataModel] = []
    var filtreliModel : [SpacexDataModel]?
    
    var dataToBeSent : SpacexDataModel?
    
    var model : [SpacexDataModel]?
    let viewModel : DashboardViewModelProtocol = DashboardViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setUpDelegate(self)
        viewModel.initialize()
      
        tableView.dataSource = self
        tableView.delegate = self
       }
    
    @IBAction func switcClicked(_ sender: Any) {
        if Switch.isOn {
            for k in 0...108 {
                let name = model![k]
                filtre.insert(name, at: 0)
                tableView.reloadData()
            }
  
        } else {
            tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let nextViewController = segue.destination as? DetailsViewController
            nextViewController!.data = dataToBeSent
    }
    
}
}
extension SpacexDataViewController: DashboardViewModelOutputProtocol {
    func showData(content: [SpacexDataModel]) {
        model = content
        tableView.reloadData()
    }
}

extension SpacexDataViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.model else { return 0 }
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
     
        if Switch.isOn {
            filtreliModel = filtre
            guard let content = filtreliModel?[indexPath.row] else { return TableViewCell()}
            cell.configure(content: [content])
          
        } else {
            guard let content = model?[indexPath.row] else { return TableViewCell()}
            cell.configure(content: [content])
          }
           return cell
         }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Switch.isOn {
            dataToBeSent = filtreliModel![indexPath.row]
        } else {
            dataToBeSent = model![indexPath.row]
        }
        performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    }

