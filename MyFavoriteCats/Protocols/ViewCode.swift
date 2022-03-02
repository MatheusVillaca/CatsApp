//
//  ViewCode.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import Foundation

protocol ViewCode {
    func setupViewHierarchy()
    func setupConstraints()
    func configureView()
    func setupView()
}

extension ViewCode {
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        configureView()
    }
}
