//
//  ViewController.swift
//  game
//
//  Created by lukga dekanadze on 06.05.24.
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
        case Nought
        case Croos
    }
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    
    @IBOutlet weak var a2: UIButton!
    
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    
    @IBOutlet weak var c2: UIButton!
    
    @IBOutlet weak var c3: UIButton!
    var firsturn = Turn.Croos
    var currentTurn = Turn.Croos
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    var noughtScoore = 0
    var croosScoore = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    func initBoard()   {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)

    }
    
    @IBAction func boardTubAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkForVictory(CROSS) {
             croosScoore += 1
            resultAlert(title: "X win!")
        }
        if checkForVictory(NOUGHT) {
            noughtScoore += 1
            resultAlert(title: "O  win!")
        }
        if(fullBoard()) {
             resultAlert(title:  "draw  ")
        }

    }

    func checkForVictory(_ s: String) -> Bool  {
        // horizonta vectory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        // vertical vectory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        // diagonal vectory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }
      
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    
    func resultAlert(title: String    )  {
        let message = "\nNought-" + String(noughtScoore) + "\n\nCroos-" + String(croosScoore )
        let ac = UIAlertController(title: "Title", message: message, preferredStyle: .actionSheet  )
        ac.addAction(UIAlertAction(title:  "Reset", style: .default , handler:   { (_) in self.resetBoard() }))
            self.present(ac, animated: true)
    }
    func resetBoard() {
        
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if(firsturn == Turn.Nought ){
            firsturn = Turn.Croos
            turnLabel.text = CROSS
        }
        else   if(firsturn == Turn.Croos ){
            firsturn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firsturn
        
        
        
    }
    
    func fullBoard() -> Bool {
        for button  in board {
           if button.title(for: .normal ) == nil {
                 return false
            }
        }
         return true
    }
    
    
    func addToBoard(_ sender: UIButton)  {
        if(sender.title(for: .normal) == nil ) {
            
            if(currentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Croos
                turnLabel.text = CROSS
            }
         else if(currentTurn == Turn.Croos) {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
    
    
}

