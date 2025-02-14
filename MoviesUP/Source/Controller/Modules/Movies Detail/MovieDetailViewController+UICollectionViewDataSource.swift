//
//  MovieDetailViewController+UICollectionViewDataSource.swift
//  MoviesUP
//
//  Created by Julio Garavelli on 26/11/19.
//  Copyright © 2019 Julio Garavelli. All rights reserved.
//

import UIKit

//MARK: UICollectionViewDataSource
extension MovieDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: "castCell", for: indexPath) as? ImageCastCollectionViewCell else {
            return UICollectionViewCell()
        }

        //setup image in cell
        let cast = self.cast[indexPath.row]
        let fullURLImages = "https://image.tmdb.org/t/p/w185_and_h278_bestv2"
        
        cell.nameLabel?.text = cast.name
        cell.characterNameLabel?.text = cast.character

        // get movie images
        if let imageUrl = cast.profilePath {
            let url = URL(string: fullURLImages + imageUrl)
            cell.imageView.kf.setImage(with: url)
        }
        return cell
    }
}
