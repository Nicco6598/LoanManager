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
5. **Ottenere informazioni sul prestito:** Gli utenti possono ottenere informazioni dettagliate su un prestito specifico utilizzando la funzione `getLoanInfo` specificando l'ID del prestito.

## Requisiti

Assicurati di soddisfare i seguenti requisiti prima di utilizzare il contratto LoanManager:

- Un ambiente Ethereum o una blockchain di test compatibile.
- Un client Ethereum, ad esempio [Ganache](https://www.trufflesuite.com/ganache) per sviluppo locale.
- Un portafoglio Ethereum compatibile per interagire con il contratto.

## Deploy su una Blockchain

Puoi distribuire il contratto LoanManager su una blockchain Ethereum seguendo questi passaggi:

1. Configura il tuo ambiente di sviluppo con il client Ethereum e il portafoglio.
2. Compila il contratto Solidity.
3. Effettua il deploy del contratto sulla blockchain utilizzando il tuo portafoglio.
4. Interagisci con il contratto tramite chiamate di funzione utilizzando il tuo portafoglio o un'applicazione front-end.

## Esempi di Chiamate di Funzione

Ecco alcuni esempi di chiamate di funzione possibili con il contratto LoanManager:

- Creazione di un prestito:
  ```solidity
  // Imposta l'importo del prestito a 1 ETH, il tasso di interesse al 5% e la durata di 30 giorni
  borrow(1, 5, 30);
