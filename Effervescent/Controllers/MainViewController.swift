//
//  MainViewController.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import UIKit
import Alamofire
import PKHUD

class MainViewController: UIViewController {

    @IBOutlet weak var boardsCollectionView: UICollectionView!
    
    var boardsList: [Catalog]?
    var board: String?
    var boardTitle: String?
    @IBOutlet weak var boardsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if board == nil {
            performSegue(withIdentifier: "boards", sender: nil)
        } else {
            request(board: board)
        }
    }
    
    @IBAction func boardsButtonAct(_ sender: Any) {
        performSegue(withIdentifier: "boards", sender: nil)
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        request(board: board)
        navigationItem.title = boardTitle
    }
}

extension MainViewController {
    func setup() {
        boardsCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")
    }
    
    func request(board: String?) {
        AF.request(String(format: GeneralSettings.url.catalog, String(board!))).responseJSON { response in
            HUD.show(HUDContentType.progress)
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.boardsList = try jsonDecoder.decode([Catalog].self, from: jsonData)
                        self.boardsCollectionView.reloadData()
                        self.boardsCollectionView.setContentOffset(CGPoint(x:0,y:-5), animated: true)
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boardsList?[section].threads?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PostCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        
        cell.board = board
        cell.prepareCell(post: boardsList?[0].threads?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 15, height: 150)
    }
}
