//
//  BoardsViewController.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import UIKit
import Alamofire
import PKHUD

class BoardsViewController: UIViewController {

    @IBOutlet weak var boardsTableView: UITableView!
    
    var boardsList: Main?
    var boardTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        
        navigationItem.titleView = searchBar
        
        request()
        
        self.boardsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwind" {
            let selectedBoard: String = sender as! String
            let destinationVC = segue.destination as! MainViewController
            destinationVC.board = selectedBoard
            destinationVC.boardTitle = boardTitle
        }
    }
}

extension BoardsViewController {
    func request() {
        AF.request(GeneralSettings.url.boards).responseJSON { response in
            HUD.show(HUDContentType.progress)
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.boardsList = try jsonDecoder.decode(Main.self, from: jsonData)
                        self.boardsTableView.reloadData()
                    } catch let error{
                        print(String(describing: error))
                    }
                }
            case .failure(let error):
                print(error)
            }
            HUD.hide(afterDelay: 0.2)
        }
    }
}

extension BoardsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boardsList?.boards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = boardsTableView.dequeueReusableCell(withIdentifier: "cell")!

        cell.textLabel?.text = String(format: "[%@] - %@", String(boardsList?.boards?[indexPath.row].board ?? ""), String(boardsList?.boards?[indexPath.row].title ?? ""))

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        boardTitle = boardsList?.boards?[indexPath.row].title ?? ""
        performSegue(withIdentifier: "unwind", sender: boardsList?.boards?[indexPath.row].board ?? "")
    }
}

extension BoardsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // TODO: Arama özelliği eklenecek. Array filtreleme.
    }
}
