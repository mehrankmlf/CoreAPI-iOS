import UIKit

class LoadingView: UIView {


    // MARK: - Inner Types

    private enum Constants {
        static let loadingViewHeight: CGFloat = 80
        static let loadingViewWidth: CGFloat = 80
        static let defaultPadding: CGFloat = 8
    }


    // MARK: - Properties
    // MARK: Immutable

    private let loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        return activityIndicator
    }()

    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var loadingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loadingIndicator, loadingLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()


    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupSubViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Setups

    private func setupView() {
        isHidden = true

    }

    private func setupSubViews() {
        addSubview(loadingStackView)
    }

    private func  setupConstraints() {
        loadingStackView.pinEdges(to: self)
        NSLayoutConstraint.activate([
            loadingStackView.topAnchor.constraint(equalTo: topAnchor),
            loadingStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            loadingStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    // MARK: - Actions

    func show() {
        isHidden = false
        loadingIndicator.startAnimating()
    }

    func hide() {
        isHidden = true
        loadingIndicator.stopAnimating()
    }
}
