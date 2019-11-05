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
    
    var data: Data? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.languages = Service().getLanguages()

        self.collectionViewData.reloadData()
        //getLanguages()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let language = languages[indexPath.row]
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LanguagesCell", for: indexPath) as! CollectionViewCell
        
        cell.displayContent(imageURLParam: language.imageURL, title: language.name!)

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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
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

