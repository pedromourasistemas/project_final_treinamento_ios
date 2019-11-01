//
//  Service.swift
//  ProjectFinal-TreinamentoIOS
//
//  Created by Pedro Henrique de Moura on 30/10/19.
//  Copyright © 2019 Pedro Moura. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON
import AlamofireObjectMapper

public class Service: NSObject {
    
    // MARK: VARIABLES
    let ROOT = "https://curso-iniciantes-1.getsandbox.com"
    let LANGUAGES = "/collectionView/programmingLanguages"
    
    // MARK: METHODS
    func getLanguages() {
        
        Alamofire.request(ROOT+LANGUAGES, parameters: nil)
                 .responseObject { (response: DataResponse<ProgrammingMain>) in
                    
                    let data = response.result.value
                    
                    //Printer objects in console
                    print(data?.programmingLanguages[0].name)
                    print(data?.programmingLanguages[1].name)
        }
    }
}
