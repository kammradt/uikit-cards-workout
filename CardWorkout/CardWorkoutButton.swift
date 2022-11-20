import UIKit

class CardWorkoutButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) not implemented")
    }
    
    init(color: UIColor, title: String, iconName: String) {
        super.init(frame: .zero)
        
        configuration = .filled()
        configuration?.title = title
        configuration?.baseForegroundColor = .white
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.image = UIImage(systemName: iconName)
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = 5
     
        translatesAutoresizingMaskIntoConstraints = false
    }
}
