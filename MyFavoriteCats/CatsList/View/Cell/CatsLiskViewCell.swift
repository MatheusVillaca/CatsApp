//
//  CatsLiskViewCell.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit

protocol CatsListViewCellDelegate {
    func favoriteAction(index: Int)
}

final class CatsListViewCell: UICollectionViewCell, ViewCode {
    
    var index: Int = 0
    
    var isFavorite: Bool = false
    
    var catBreed: UILabel = {
        var catBreed: UILabel = UILabel(frame: .zero)
        catBreed.font = catBreed.font.withSize(20)
        catBreed.textColor = .white
        catBreed.textAlignment = .center
        catBreed.backgroundColor = .black.withAlphaComponent(0.5)
        catBreed.numberOfLines = 0
        catBreed.translatesAutoresizingMaskIntoConstraints = false
        return catBreed
    } ()
    
    var catImage: UIImageView = {
        var catImage: UIImageView = UIImageView(frame: .zero)
        catImage.translatesAutoresizingMaskIntoConstraints = false
        return catImage
    } ()
    
    let favoriteButton: UIButton = {
        let favoriteButton: UIButton = UIButton(type: .custom)
        favoriteButton.setImage(UIImage(named: "NoSelectedFavorite.png"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        return favoriteButton
    } ()
    
    var delegate: CatsListViewCellDelegate?
    
    func setup(catBreed: String, catImageURL: URL?, delegate: CatsListViewCellDelegate, index: Int, isFavorite: Bool) {
        self.catBreed.text = catBreed
        if let url: URL = catImageURL {
            URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data, error == nil,
                     let image = UIImage(data: data)
                else { return }
               DispatchQueue.main.async() {
                   self.catImage.image = image
               }
           }.resume()
        }
        
        self.delegate = delegate
        self.index = index
        self.isFavorite = isFavorite
        setupView()
    }
    
    
    func setupViewHierarchy() {
        contentView.addSubview(catImage)
        contentView.addSubview(catBreed)
        contentView.addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        catImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        catImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        catImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        catImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        catBreed.leadingAnchor.constraint(equalTo: catImage.leadingAnchor).isActive = true
        catBreed.trailingAnchor.constraint(equalTo: catImage.trailingAnchor).isActive = true
        catBreed.bottomAnchor.constraint(equalTo: catImage.bottomAnchor).isActive = true
        
        favoriteButton.topAnchor.constraint(equalTo: catImage.topAnchor, constant: 8).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: -8).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func configureView() {
        backgroundColor = .white
        setupFavoriteButton()
    }
    
    @objc func didTapFavoriteButton() {
        isFavorite.toggle()
        setupFavoriteButton()
        delegate?.favoriteAction(index: index)
    }
    
    func setupFavoriteButton() {
        switch isFavorite {
        case true:
            favoriteButton.setImage(UIImage(named: "SelectedFavorite.png"), for: .normal)
        default:
            favoriteButton.setImage(UIImage(named: "NoSelectedFavorite.png"), for: .normal)
        }
    }
    
    
}
