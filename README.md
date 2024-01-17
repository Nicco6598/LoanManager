# LoanManager Smart Contract

LoanManager è un contratto intelligente (smart contract) basato su Ethereum che gestisce prestiti tra utenti sulla blockchain. Consente agli utenti di prendere in prestito fondi, ripagare i prestiti e gestire i prestiti in modo efficace. Il contratto tiene traccia degli indirizzi degli utenti, degli importi dei prestiti, dei tassi di interesse, dei periodi di tempo, dello stato dei prestiti e altro ancora.

## Funzionalità

Il contratto LoanManager include le seguenti funzionalità:

- Registrazione degli indirizzi degli utenti che prendono o concedono prestiti.
- Tracciamento degli importi associati a ciascun prestito, inclusi gli interessi.
- Visualizzazione dei tassi di interesse applicati a ciascun prestito.
- Gestione del periodo di tempo per il rimborso di ciascun prestito.
- Registrazione della data di inizio e di fine del prestito.
- Gestione dello stato del prestito (attivo, pagato, scaduto, ecc.).
- Possibilità per gli utenti di prendere in prestito fondi.
- Possibilità per gli utenti di ripagare un prestito dopo averlo ricevuto.
- Annullamento di un prestito da parte del proprietario del contratto.
- Gestione dei casi in cui il prestito viene ripagato in ritardo, con un sistema di penali.
- Controllo che il pagamento del prestito sia restituito in una rata unica, con l'importo necessario da pagare, includendo le penali.
- Calcolo automatico dell'interesse da pagare sul prestito in base al tasso di interesse e al periodo di tempo.
- Calcolo dell'importo della penale applicata a un prestito in ritardo.

## Utilizzo

Per utilizzare il contratto LoanManager, puoi seguire i seguenti passaggi:

1. **Creazione di un prestito:** Utilizza la funzione `borrow` per creare un prestito specificando l'importo del prestito, il tasso di interesse e il periodo di tempo.
2. **Prendere in prestito fondi:** Gli utenti possono prendere in prestito fondi esistenti utilizzando la funzione `takeLoan` specificando l'ID del prestito.
3. **Ripagare un prestito:** Gli utenti possono ripagare un prestito utilizzando la funzione `repayLoan` specificando l'ID del prestito. L'importo totale del prestito, inclusi gli interessi e le penali, verrà calcolato automaticamente.
4. **Annullare un prestito:** L'owner del contratto può annullare un prestito utilizzando la funzione `cancelLoan` specificando l'ID del prestito.
5. **Ottenere informazioni sul prestito:** Gli utenti possono ottenere informazioni dettagliate su un prestito specifico utilizzando la funzione `Loans` specificando l'ID del prestito.

## Requisiti

Assicurati di soddisfare i seguenti requisiti prima di utilizzare il contratto LoanManager:

- Un ambiente Ethereum o una blockchain di test compatibile.
- Un client Ethereum, ad esempio [Ganache](https://www.trufflesuite.com/ganache) per sviluppo locale.
- Un portafoglio Ethereum compatibile per interagire con il contratto.

## Deploy su una Blockchain

Puoi distribuire il contratto LoanManager su una blockchain Ethereum seguendo questi passaggi:

1. Configura il tuo ambiente di sviluppo con il client Ethereum e il portafoglio.
2. Compila il contratto Solidity o importalo dall'address 0x1f9E0C5D2304B2141179554602996FcB9c493AA3
3. Effettua il deploy del contratto sulla blockchain utilizzando il tuo portafoglio.
4. Interagisci con il contratto tramite chiamate di funzione utilizzando il tuo portafoglio o un'applicazione front-end.

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
- Apri una pull request con una descrizione dettagliata delle tue modifiche.
- Domande e Supporto
- In caso di domande o bisogno di supporto, puoi aprire una issue su GitHub o contattare l'autore principale del progetto.

Grazie per aver utilizzato LoanManager!
