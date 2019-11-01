//
//  ViewController.swift
//  ProjectFinal-TreinamentoIOS
//
//  Created by Pedro Henrique de Moura on 28/10/19.
//  Copyright © 2019 Pedro Moura. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionViewData: UICollectionView!
    
    var images:[String] = []
    var lableTitles:[String] = []
    
    var languages:[Languages] = []
    
    let ROOT = "https://curso-iniciantes-1.getsandbox.com"
    let LANGUAGES = "/collectionView/programmingLanguages"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Service().getLanguages()
        getLanguages()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LanguagesCell", for: indexPath) as! CollectionViewCell
        
        cell.languageLabel.text = languages[indexPath.row].name

        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.languageLabel.text = self.lableTitles?[indexPath.row].desc
        //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

        return cell
    }

    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(
        width: (self.view.frame.width - 45) / 2,
        height: 53
      )
    }
    
    func getLanguages() {
        
        Alamofire.request(ROOT+LANGUAGES, parameters: nil)
                 .responseObject { (response: DataResponse<ProgrammingMain>) in
                    
                    let data = response.result.value
                    
                    //Printer objects in console
                    //print(data?.programmingLanguages[0].name)
                    //print(data)
                    
                    self.languages = data?.programmingLanguages ?? []

                    self.collectionViewData.reloadData()
        }
    }

}

