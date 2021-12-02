//
//  MovieViewController.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    var movieList = MoviesViewModel(movies: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configureContents() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }

}

//MARK: - UICollectionViewDelegate
extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 5, left: 5, bottom: 5, right: 5)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth = (collectionView.frame.width - (3 * 5)) / 2
            return .init(width: cellWidth, height: cellWidth)
        }
    
}

//MARK: - UICollectionViewDataSource Methods
extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.getMovieCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
//        https://image.tmdb.org/t/p/w500{poster_path}
        return cell
    }
    
}
