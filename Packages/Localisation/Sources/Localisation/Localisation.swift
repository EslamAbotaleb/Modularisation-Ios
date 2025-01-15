import Foundation

public extension String {
    var localisedCommon: String {
        //bundle mean here we can let the the system know we want to initialize a localized string 
        NSLocalizedString(self,bundle: .module, comment: "")
    }
}
