import UIKit

class PaymentTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 탭바 배경 및 색상 설정
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .systemGroupedBackground

        // 각 결제 방식 ViewController 생성
        let cashVC = storyboard?.instantiateViewController(withIdentifier: "CashPaymentViewController") ?? UIViewController()
        let cardVC = storyboard?.instantiateViewController(withIdentifier: "CardPaymentViewController") ?? UIViewController()

        cashVC.tabBarItem = UITabBarItem(title: "현금", image: UIImage(systemName: "banknote"), tag: 0)
        cardVC.tabBarItem = UITabBarItem(title: "카드", image: UIImage(systemName: "creditcard"), tag: 1)

        viewControllers = [cashVC, cardVC]
    }
}
