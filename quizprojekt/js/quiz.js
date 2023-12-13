let currentQuestion = 0; // Variabel som håller reda på den aktuella frågan i quizet
let score = 0; // Variabel som håller reda på poängen

const quizData = []; // Array som lagrar frågeuppgifterna

// Hämtar element med sina respektive id
const imageElement = document.getElementById('image');
const questionElement = document.getElementById('question');
const optionsElement = document.getElementById('options');
const scoreElement = document.getElementById('score');
const questionsLeftElement = document.getElementById('questions-left');


// När fönstret laddar så körs hamtaquizdata function
window.onload = function() {
  hamtaquizdata();
}

//hämtar datan från extern url med hjälp av fetch
function hamtaquizdata() {
  return fetch('https://www.datanom.ax/~47493/quizprojekt/php/hemtadata.php')
    .then(function(response) {
      if (response.status === 200) {
        return response.json();
      } else {
        throw new Error('kunde inte fetcha quiz data');
      }
    })
    //efter den har hämtat datan så sätter den in datan i en array
    .then(function(data) {
      quizData.push(...data);
      loadQuiz();
    })  
}

//laddar quizet genom att anropa loadQuestion()
function loadQuiz() {
  loadQuestion();
}

//addar en fråga och svarsalternativen till den frpgan
function loadQuestion() {
  if (currentQuestion >= quizData.length) {
    //om det inte finns fler frågor att visar så rensar den gränssnittet och visar resultaten
     questionElement.innerText = '';
     imageElement.src = ''; 
     optionsElement.innerHTML = '';
     scoreElement.innerText = `Ditt resultat: ${score} / ${quizData.length}`;
     questionsLeftElement.innerText = '';
     document.getElementById('image').remove();
     return;
  }

  const currentQuizData = quizData[currentQuestion];

  if (currentQuizData && currentQuizData.val) {
    //visa frågan och svarsalternativen
    imageElement.src = '../pictures/' + currentQuizData.bild;
    questionElement.innerText = currentQuizData.fraga;

    optionsElement.innerHTML = '';
    const options = currentQuizData.val.split(',');

    for (let i = 0; i < options.length; i++) {
      //skapa knappar för svarsalternativen
      const optionButton = document.createElement('button');
      optionButton.classList.add('option-btn');
      optionButton.innerText = options[i].trim();
      optionButton.onclick = checkOptions;
      optionsElement.appendChild(optionButton);
    }

    questionsLeftElement.innerText = `Frågor kvar: ${quizData.length - currentQuestion}`;
  } else {
    // hanterar fallet där datan är ogiltig eller saknas
    console.error('datan är ogiltig eller saknas');
  }
}

// funktion som kallas när användaren klickar på ett svarsalternativ
function checkOptions(event) {
  const selectedOption = event.target;
  const userOption = selectedOption.innerText.trim().toLowerCase().replace(/\s+/g, ''); 
  

  if (userOption !== '') {
    const data = {
      ratt: userOption,
      id: quizData[currentQuestion].id 
    };
    console.log('userOption:', userOption);
console.log('question ID:', quizData[currentQuestion].id);
    
    fetch('https://www.datanom.ax/~47493/quizprojekt/php/rattaFraga.php', {
      method: 'POST',
      body: JSON.stringify(data)
    })
      .then(function(response) {
        if (response.status === 200) {
          return response.json();
        } else {
          throw new Error('kunde inte skicka in svar');
        }
      })
      .then(function(data) {
        if (data.utskrift === 1) {    
          //om svaret är rätt lägger den till en klassen correct och plussar 1 på poängen     
          selectedOption.classList.add('correct');
          score++;
        } else {
          //om inte rätt lägger den till klassen incorrect bara
          selectedOption.classList.add('incorrect');
        }
        // inaktiverar alla svarsalternativ knappar efter man har truckit på ett svar
        const optionButtons = document.querySelectorAll('.option-btn');
        optionButtons.forEach((button) => {
          button.disabled = true;
        });

        // pausar i en sekund innan den går vidare till nästa fråga
        currentQuestion++;
        setTimeout(() => {
          loadQuestion();
        }, 1000);
      })
    }
  }





