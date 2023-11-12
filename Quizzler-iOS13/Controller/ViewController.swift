import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    var quizBrain = QiuzBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    @IBAction func anwerButtonPressed(_ sender: UIButton) { // При кадом нажатии какой-либо кнопки в параметры этого метода передается нажатая кнопка(sender)
        
        let userAnswer = sender.currentTitle! // Здесь получаем название(title) нажатой кнопки
        let userGotItRight = quizBrain.checkAnswer(userAnswer) // проверка нажатого ответа по названию нажатой кнопки
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion() // вызываем следующий вопрос
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()// текст вопроса
        progressBar.progress = quizBrain.getProgress() // текущий прогресс
        scoreLabel.text = "Score: \(quizBrain.getScore())" // количество очков
        let answers = quizBrain.getAnswers().shuffled() // варианты ответов перемешанные
        firstAnswerButton.setTitle(answers[0], for: .normal)// заполняем кнопки вариантами ответа
        secondAnswerButton.setTitle(answers[1], for: .normal)
        thirdAnswerButton.setTitle(answers[2], for: .normal)
        firstAnswerButton.backgroundColor = UIColor.clear //обновляем фон кнопок
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
        
        
    }
    
    
}

