//
//  ViewController.swift
//  interview
//
//  Created by Balaji  on 06/02/24.
//

import UIKit

struct HitsModel: Codable {
    let total, totalHits: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let id: Int
    let pageURL: String
    let type, tags: String
    let previewURL: String
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiCall()
    }
    
    
    func apiCall() {
        
        let hitdata = """
{"total":199842,"totalHits":500,"hits":[{"id":324175,"pageURL":"https://pixabay.com/photos/pink-cherry-blossoms-flowers-branch-324175/","type":"photo","tags":"pink, cherry blossoms, flower","previewURL":"https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_150.jpg"},{"id":729510,"pageURL":"https://pixabay.com/photos/marguerite-daisy-flower-white-729510/","type":"photo","tags":"marguerite, daisy, flower","previewURL":"https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_150.jpg"},{"id":2277,"pageURL":"https://pixabay.com/photos/berries-fruits-food-blackberries-2277/","type":"photo","tags":"berries, fruits, food","previewURL":"https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_150.jpg"},{"id":1274894,"pageURL":"https://pixabay.com/photos/ice-cream-dessert-food-snack-1274894/","type":"photo","tags":"ice cream, dessert, food","previewURL":"https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_150.jpg"}]}
""".data(using: .utf8)!
        
        do {
            let json = try JSONDecoder().decode(HitsModel.self, from: hitdata)
            
            print(json)
        } catch {
            
        }
        
        
        guard let url = URL(string: "https://www.jsonkeeper.com/b/6JS0") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let error = err else {
                return }
            
            guard let resData = data else {
                return }
            
            do {
                let jsonData = try! JSONSerialization.jsonObject(with: resData)
                
                let json = try JSONDecoder().decode(HitsModel.self, from: hitdata)
                
                print(json)
                
            } catch  {
                
            }
            
        }.resume()
    }
    
}

