//
//  SRPPresenter.swift
//  SRP
//
//  Created by Jeytery on 04.04.2022.
//

import Foundation

// By SRP here you create all logic of some screen
// You go ahead and devide this part of screen in more modules
// Like this make in VIPER -
// you have not only presenter -
// interactor (for networking), router (for navigation)

// But this simple example just want you to understand that you could and
// sometimes should devide your complex part of programm in separate modules
// to keep it simple

// This is the main idea of SRP in iOS development for my oppinion

protocol SRPPresenterInput: AnyObject {
    // ... base logic functionality of module
}

class SRPPresenter: SRPPresenterInput {
    
    private unowned let viewInput: SRPViewControllerInput
    
    init(viewInput: SRPViewControllerInput) {
        self.viewInput = viewInput
        getJokes()
        viewInput.startLoading()
    }
    
    private func getJokes() {
        API.getJokes() {
            [weak viewInput] result in
            viewInput?.stopLoading()
            switch result {
            case .success(let jokes):
                viewInput?.displayJokes(jokes)
                break
            case .failure(let error):
                return print(error)
            }
        }
    }
}

extension SRPPresenter: SRPViewControllerOutput {
    func view(didSelect joke: Joke, at indexPath: IndexPath) {
        viewInput.showAlert(with: joke.body)
    }
}
