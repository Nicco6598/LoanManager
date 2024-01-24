// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import della libreria per i calcoli finanziari
import "./LoanLibrary.sol";

contract LoanManager {
    struct Loan {
        address lender;
        address borrower;
        uint256 principalAmount;
        uint256 interestRate;
        uint256 startTime;
        uint256 endTime;
        bool isPaid;
        uint256 totalAmount;
    }

    mapping(uint256 => Loan) public loans;
    uint256 public loanCounter;
    address public owner;

    // Eventi per il logging delle azioni
    event LoanCreated(uint256 loanId, address lender, address borrower, uint256 principalAmount, uint256 interestRate, uint256 startTime, uint256 endTime);
    event LoanPaid(uint256 loanId, uint256 amountPaid);
    event LoanLatePayment(uint256 loanId, uint256 penaltyAmount);
    event LoanCanceled(uint256 loanId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo il creatore del contratto puo' annullare un prestito");
        _;
    }

    constructor() {
        owner = msg.sender;
        loanCounter = 0;
    }

    function borrow(uint256 _principalAmountInEther, uint256 _interestRate, uint256 _durationInDays) external payable {
        require(_principalAmountInEther > 0, "L'importo deve essere maggiore di 0");
        require(_interestRate > 0, "Gli interessi devono essere maggiori di 0");
        require(address(this).balance >= msg.value, "Il contratto non ha abbastanza fondi per questo prestito");

        uint256 principalAmountInWei = _principalAmountInEther * 1 ether;
        uint256 endTime = block.timestamp + _durationInDays * 1 days;
        uint256 totalAmount = principalAmountInWei + FinancialLibrary.calculateInterest(principalAmountInWei, _interestRate, block.timestamp, endTime);
        loans[loanCounter] = Loan(msg.sender, address(0), principalAmountInWei, _interestRate, block.timestamp, endTime, false, totalAmount);
        emit LoanCreated(loanCounter, msg.sender, address(0), principalAmountInWei, _interestRate, block.timestamp, endTime);
        loanCounter++;
    }

    function takeLoan(uint256 loanId) external {
        Loan storage loan = loans[loanId];
        require(loan.lender != address(0), "Il prestito non esiste");
        require(!loan.isPaid, "Il prestito e' gia' stato ripagato");
        require(loan.borrower == address(0), "Il prestito con questo ID e' gia' stato preso");
        require(msg.sender != loan.lender, "Il prestatore non puo' prendere in carico il proprio prestito");

        loan.borrower= msg.sender;
        payable(loan.borrower).transfer(loan.principalAmount);
    }

    function repayLoan(uint256 loanId) external payable {
        Loan storage loan = loans[loanId];
        require(!loan.isPaid, "Il prestito e' gia' stato ripagato");
        require(msg.sender == loan.borrower, "Solo chi ha preso il prestito puo' ripagarlo");

        uint256 interest = FinancialLibrary.calculateInterest(loan.principalAmount, loan.interestRate, loan.startTime, block.timestamp);
        uint256 totalAmount = loan.principalAmount + interest;
        require(msg.value >= totalAmount, "Fondi insufficienti inviati");

        if (block.timestamp > loan.endTime) {
            uint256 penalty = FinancialLibrary.calculatePenalty(loan.principalAmount, loan.endTime, block.timestamp);
            totalAmount += penalty;
            emit LoanLatePayment(loanId, penalty);
        }

        loan.isPaid = true;
        payable(loan.lender).transfer(totalAmount);
        emit LoanPaid(loanId, totalAmount);
    }

    function cancelLoan(uint256 loanId) external onlyOwner {
        Loan storage loan = loans[loanId];
        require(!loan.isPaid, "Non si puo' cancellare un prestito gia' ripagato");

        loan.isPaid = true;
        payable(loan.lender).transfer(loan.principalAmount);
        emit LoanCanceled(loanId);
    }
}
