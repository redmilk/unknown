//
//  HomePresenter.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

import Foundation

final class HomePresenter: Presenter {
    
    var view: HomeViewControllerIn!
    
    private var viewModel: HomeViewController.ViewModel = .initial
    private var classicQuizFetchParams: ClassicQuizFetchParams = .initial
    private var classicQuizList: [ClassicQuizModel] = []
    private var latestAnsweredID: String?
    
    init() { 
        // TODO: Add DI
    }
    
    func viewDidLoad() {
        viewModel = makeInitialViewModel()
        view?.update(with: viewModel)
//        /// TEST
//        let collectionModel = self.makeViewModel(classicQuiz: HomeUtils.quiz)
//        self.view?.update(with: .init(collectionViewModel: collectionModel))
    }
    
    func onGenerateClassicPack(params: ClassicQuizFetchParams) {
        let message = Message(
            id: UUID(),
            role: .user,
            content: Prompts.getClassicQuiz(params: params),
            createdAt: Date()
        )
        APIClientImpl.shared.sendMessage(messages: [message], completion: { [weak self] questions in
            guard let self else { return }
            guard let questions else {
                DispatchQueue.main.async {
                    self.viewModel = self.makeViewModel()
                    self.view.update(with: self.viewModel)
                }
                return
            }
            print("✅ Questions: \(questions.count)")
            self.classicQuizList.insert(contentsOf: questions, at: 0)
            self.viewModel = self.makeViewModel()
            DispatchQueue.main.async {
                self.view?.update(with:self.viewModel)
            }
            
            DispatchQueue.global(qos: .utility).async {
                FirestoreClient.shared.uploadClassicQuizModels(questions)
            }
        })
    }
    
    private func makeInitialViewModel() -> HomeViewController.ViewModel {
        let headerItem1 = HeaderCell.ViewModel(
            state: .loaded,
            title: "Classic Quiz Generator",
            subtitle: "",
            contentURL: URL(string: "https://www.gstatic.com/webp/gallery/1.webp"),
            isVideo: false,
            classicQuizFetchParams: .initial,
            onGenerateClassicQuiz: CommandWith(action: { [weak self] fetchParams in
                self?.onGenerateClassicPack(params: fetchParams)
                self?.classicQuizFetchParams = fetchParams
            })
        )
        let header = HomeCollectionView.ViewModel.Block(section: .header, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .header(headerItem1))
        ])
        let collectionModel = HomeCollectionView.ViewModel(
            blocks: [header],
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        let viewModel = HomeViewController.ViewModel(state: .loaded, collectionViewModel: collectionModel)
        return viewModel
    }
    
    private func makeViewModel() -> HomeViewController.ViewModel {
        // MARK: - Block 0 - Header
        let headerItem1 = HeaderCell.ViewModel(
            state: .loaded,
            title: "Classic Quiz Generator",
            subtitle: "",
            contentURL: URL(string: "https://www.gstatic.com/webp/gallery/1.webp"),
            isVideo: false,
            classicQuizFetchParams: classicQuizFetchParams,
            onGenerateClassicQuiz: CommandWith(action: { [weak self] fetchParams in
                self?.onGenerateClassicPack(params: fetchParams)
                self?.classicQuizFetchParams = fetchParams
            })
        )
        let header = HomeCollectionView.ViewModel.Block(section: .header, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .header(headerItem1))
        ])
        
        // MARK: - Block 1
        let block1Model = ContentCell.ViewModel(title: "Test", previewUrl: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, onSelect: .nop)
        let block1 = HomeCollectionView.ViewModel.Block(section: .verticalDouble, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
        ])
        
        // MARK: - Block 2
        let block2Model = block1Model
        let block2 = HomeCollectionView.ViewModel.Block(section: .horizontal, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
        ])
        
        // MARK: - Block 3
        let block3Model = MultipleImageCell.ViewModel(
            title: "Test title",
            isPreviewed: false,
            items: [
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
            ], 
            onSelect: .nop
        )

        let block3 = HomeCollectionView.ViewModel.Block(section: .horizontalCollections, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
        ])
        
        // MARK: - Block 4 - Classic Quiz
        let block4Items = classicQuizList.enumerated().map { pair in
            let model = ClassicQuizCell.ViewModel(
                state: .init(answerState: pair.element.answerState),
                question: pair.element.question,
                asnwers: pair.element.answers,
                category: pair.element.category,
                correctAnswer: pair.element.correctAnswer,
                answerExplanation: pair.element.answerExplanation, 
                curiousFacts: pair.element.facts,
                image: nil,
                isLatestAnsweredQuiz: latestAnsweredID == pair.element.id,
                onAnswerPressed: CommandWith(action: { [weak self] answer in
                    guard let self else { return }
                    let quizModel = self.classicQuizList.first(where: { $0.id == pair.element.id })
                    quizModel?.answerState = AnswerState(answer: answer, correctAnswer: pair.element.correctAnswer)
                    self.latestAnsweredID = quizModel?.id
                    self.viewModel = self.makeViewModel()
                    self.view?.update(with: self.viewModel)
                })
            )
            return HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(model))
        }

        let block4 = HomeCollectionView.ViewModel.Block(section: .classicQuiz, items: block4Items)
        
        // MARK: - Result
        let collectionModel = HomeCollectionView.ViewModel(
            blocks: [header, block4, block3, block2, block1],
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        
        let viewModel = HomeViewController.ViewModel(state: .loaded, collectionViewModel: collectionModel)

        return viewModel
    }
    
    private func onClassicQuizAnswerTap(_ answer: String, correctAnswer: String) {
        guard answer == correctAnswer else {
            return
        }
        
        
    }
}
