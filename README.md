# LoanManager Smart Contract

LoanManager è un contratto intelligente su Ethereum che gestisce prestiti digitali. Funge da intermediario automatizzato, monitorando i termini, gli interessi e le scadenze dei prestiti, assicurando una gestione efficiente e trasparente.

## Funzionalità

Questo contratto offre funzionalità come:

- Registrazione di Utenti e Prestiti: Identifica partecipanti e registra i dettagli dei prestiti.
- Gestione Interessi e Scadenze: Calcola interessi e tiene traccia delle scadenze dei prestiti.
- Operazioni sui Prestiti: Permette di richiedere, rimborsare, o annullare prestiti.
- Penali per Ritardi: Impone penali in caso di ritardo nei pagamenti.
- Calcolo Automatico: Determina importi dovuti, compresi interessi e penali.

## Utilizzo

Per utilizzare LoanManager:

- Creazione di un prestito: Registra un nuovo prestito tramite la funzione borrow.
- Richiesta di fondi: Accedi ai fondi con takeLoan.
- Rimborso di un prestito: Restituisci i fondi con repayLoan.
- Annullamento di un prestito: Annulla un prestito con cancelLoan se sei l'owner.
- Accesso alle informazioni: Consulta i dettagli di un prestito con la funzione loans.

## Requisiti Tecnici

Prima di iniziare, assicurati di avere:

- Un ambiente Ethereum o una blockchain di test.
- Un client Ethereum, come Ganache per lo sviluppo locale.
- Un portafoglio Ethereum per interazioni.

## Deploy su una Blockchain

- Configurazione dell'Ambiente: Imposta il tuo ambiente con il client Ethereum e il portafoglio.
- Gestione del Contratto: Compila o importa il contratto Solidity.
- Deploy del Contratto: Carica il contratto sulla blockchain tramite il tuo portafoglio.
- Interazione con il Contratto: Interagisci con il contratto tramite il tuo portafoglio o un'interfaccia front-end.

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

Licenza: Distribuito sotto licenza MIT.

# Autori
Marco Niccolini - (https://github.com/Nicco6598)
