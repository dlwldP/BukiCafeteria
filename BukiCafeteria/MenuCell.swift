import UIKit

class MenuCell: UITableViewCell {

    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = nil
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = nil
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(menuImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            // 이미지뷰 - 왼쪽에 고정
            menuImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            menuImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuImageView.widthAnchor.constraint(equalToConstant: 60),
            menuImageView.heightAnchor.constraint(equalToConstant: 60),

            // 타이틀 라벨 - 이미지 오른쪽 위
            titleLabel.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            // 가격 라벨 - 타이틀 아래
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
