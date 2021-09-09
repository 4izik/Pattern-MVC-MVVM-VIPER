
import Foundation

protocol DeleteListRouterInput{
    var outputRouter: DeleteListRouterOutput! {get set}
}

protocol DeleteListRouterOutput {
    
}

class DeleteListRouter:DeleteListRouterInput {
    var outputRouter: DeleteListRouterOutput!
}

