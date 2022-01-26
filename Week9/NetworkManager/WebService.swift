//
//  WebService.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 3.12.2021.
//

import Alamofire

class WebService {
    
    typealias CompletionHandler = (_ success: [Result] ) -> Void
       
    static func getMoviePhotos(viewController: UIViewController,completionHandler: @escaping CompletionHandler) {
           let searchURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
           AF.request(searchURL, method: .post).response { response in
               switch (response.result) {
               case .success:
                   let decoder = JSONDecoder()
                   do {
                       guard let data = response.data else { return }
                       let decodedData = try decoder.decode(Movies.self, from: data)
                       completionHandler(decodedData.results)
                   }
                   catch {
                       print("failure")
                   }
               case .failure(let error):
                   print(error)
                   let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
                   alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
                   viewController.present(alert, animated: true, completion: nil)
               }
           }
       }
    
}
