//
//  MovieViewController.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

import UIKit

final class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var movieList = MoviesViewModel(movies: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setupMovie()
    }
    
    private func configureContents() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    private func setupMovie() {
        WebService.getMoviePhotos(viewController: self) { [weak self] success in
            guard let self = self else { return }
            self.movieList.movies = success
            self.movieCollectionView.reloadData()
        }
    }
}

//MARK: - UICollectionViewDataSource Methods
extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.getMovieCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.movieCell, for: indexPath) as! MovieCollectionViewCell
        let url = "https://image.tmdb.org/t/p/w500"
        let backdrop_path = movieList.getMovieImagePath(indexPath: indexPath.row)
        let movieTitle = movieList.getMovieTitle(indexPath: indexPath.row)
        cell.titleLabel.text = movieTitle
        cell.imageView.configureKF(url: "\(url)\(backdrop_path)")
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MovieViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = (UIScreen.main.bounds.width - (3 * 5)) / 2
        let cellWidth = ( collectionView.frame.width - (3 * 5 ) ) / 2
        return .init(width: cellWidth, height: (cellWidth / 2 ) + 50 )
    }
}
