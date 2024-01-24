# LoanManager Smart Contract

LoanManager è come un "esperto" digitale che aiuta le persone a gestire i prestiti su una rete speciale chiamata Ethereum. Puoi pensarlo come a un assistente virtuale che ti permette di prendere in prestito denaro, pagare i tuoi debiti e tenere traccia di tutto in modo facile e efficiente. Questo assistente tiene nota dei nomi delle persone coinvolte, delle somme prestate, degli interessi, dei tempi e di altre informazioni importanti sui prestiti.

## Funzionalità

Il contratto LoanManager offre diverse funzionalità per semplificare la gestione dei prestiti. Prima di tutto, permette di registrare gli indirizzi degli utenti che prendono o concedono prestiti. Inoltre, è possibile tenere traccia degli importi relativi a ciascun prestito, inclusi gli interessi, e visualizzare chiaramente i tassi di interesse applicati a ogni prestito.

La piattaforma facilita anche la gestione del periodo di tempo in cui i prestiti devono essere rimborsati, registrando le date di inizio e di fine di ogni prestito. È in grado di monitorare lo stato di ogni prestito, che può essere attivo, pagato, scaduto, e così via.

Gli utenti hanno la possibilità di richiedere fondi in prestito, e allo stesso modo, possono restituire un prestito dopo averlo ricevuto. I proprietari del contratto hanno il potere di annullare un prestito in determinate situazioni.

Il sistema è in grado di gestire le situazioni in cui un prestito viene rimborsato in ritardo, applicando penali. Assicura inoltre che il pagamento del prestito venga effettuato in un'unica rata, con l'importo totale da pagare, inclusi gli interessi e le penali.

Infine, il contratto LoanManager offre un calcolo automatico dell'importo degli interessi da pagare in base al tasso di interesse e al periodo di tempo, così come il calcolo dell'ammontare delle penali applicate in caso di ritardo nel pagamento di un prestito.

## Utilizzo

Per utilizzare il contratto LoanManager, ecco come puoi fare:

- Creazione di un prestito: Inizia creando un prestito. Usa la funzione chiamata borrow e specifica l'importo del prestito, il tasso di interesse e il periodo di tempo desiderato.

- Prendere in prestito fondi: Se hai bisogno di fondi, puoi prendere in prestito quelli disponibili. Basta utilizzare la funzione takeLoan e fornire l'ID del prestito che ti interessa.

- Ripagare un prestito: Quando è il momento di restituire il prestito, usa la funzione repayLoan e specifica l'ID del prestito. Il sistema calcolerà automaticamente l'importo totale dovuto, comprensivo di interessi e penali, per te.

- Annullare un prestito: Se sei il proprietario del contratto, hai la possibilità di annullare un prestito. Utilizza la funzione cancelLoan e specifica l'ID del prestito che vuoi annullare.

- Ottenere informazioni sul prestito: Se desideri informazioni dettagliate su un prestito specifico, puoi usare la funzione Loans. Basta fornire l'ID del prestito e otterrai tutti i dettagli di cui hai bisogno.

## Requisiti

Assicurati di soddisfare i seguenti requisiti prima di utilizzare il contratto LoanManager:

- Un ambiente Ethereum o una blockchain di test compatibile.
- Un client Ethereum, ad esempio [Ganache](https://www.trufflesuite.com/ganache) per sviluppo locale.
- Un portafoglio Ethereum compatibile per interagire con il contratto.

## Deploy su una Blockchain

###Passaggio 1: Preparare il tuo ambiente di sviluppo
- Inizia configurando il tuo ambiente di sviluppo con il client Ethereum e il tuo portafoglio.

###Passaggio 2: Gestire il contratto Solidity
- Puoi compilare il contratto Solidity oppure importarlo dall'indirizzo 0xF0006A50462B2dDd953ba7C53731255AA9bfC4EA.

###Passaggio 3: Effettuare il deploy del contratto
- Ora, è il momento di mettere il contratto sulla blockchain. Usa il tuo portafoglio per effettuare il deploy.

###Passaggio 4: Interagire con il contratto
- Una volta che il contratto è online, puoi interagire con esso utilizzando chiamate di funzione tramite il tuo portafoglio o tramite un'applicazione front-end.

## Esempi di Chiamate di Funzione

Ecco alcuni esempi di chiamate di funzione possibili con il contratto LoanManager:

- Creazione di un prestito:
  ```solidity
  // Imposta l'importo del prestito a 1 ETH, il tasso di interesse al 5% e la durata di 30 giorni
  borrow(1, 5, 30);


- Prendere in prestito fondi:
   ```solidity
  // Prende in prestito fondi da un prestito esistente specificando l'ID del prestito
  takeLoan(0);
- Ripagare un prestito:
  ```solidity
  // Ripaga un prestito specifico specificando l'ID del prestito
  repayLoan(0);
- Annullare un prestito (solo per l'owner):
  ```solidity
  // Annulla un prestito specifico specificando l'ID del prestito
  cancelLoan(0);
- Ottenere informazioni su un prestito:
  ```solidity
  // Ottieni informazioni su un prestito specifico specificando l'ID del prestito
  mapping(uint256 => Loan) public loans;
  
# Licenza
Questo contratto è distribuito con una licenza MIT. Consulta il file LICENSE per ulteriori dettagli.

# Autori
Marco Niccolini - (https://github.com/Nicco6598)

## Clonare 
- Fai il fork del repository.
- Crea un branch con una descrizione chiara della tua modifica: git checkout -b feature/nome-della-funzione.
- Fai commit delle tue modifiche: git commit -m 'Aggiunta la nuova funzione'.
- Pusha il tuo branch: git push origin feature/nome-della-funzione.
