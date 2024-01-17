// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import della libreria per i calcoli finanziari
import "./LoanLibrary.sol";

contract LoanManager {
    struct Loan {
        address borrower;
        address lender;
        uint256 Ethereum;
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
    event LoanCreated(uint256 loanId, address borrower, address lender, uint256 principalAmount, uint256 interestRate, uint256 startTime, uint256 endTime);
    event LoanPaid(uint256 loanId, uint256 amountPaid);
    event LoanLatePayment(uint256 loanId, uint256 penaltyAmount);
    event LoanCanceled(uint256 loanId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        loanCounter = 0;
    }

    // Funzione per prendere in prestito dei fondi
    function borrow(uint256 _principalAmountInEther, uint256 _interestRate, uint256 _durationInDays) external payable {
        require(_principalAmountInEther > 0, "Principal amount must be greater than zero");
        require(_interestRate > 0, "Interest rate must be greater than zero");

        uint256 principalAmountInWei = _principalAmountInEther * 1 ether;
        uint256 endTime = block.timestamp + _durationInDays * 1 days;
        uint256 totalAmount = principalAmountInWei + FinancialLibrary.calculateInterest(principalAmountInWei, _interestRate, block.timestamp, endTime);
        loans[loanCounter] = Loan(msg.sender, address(0), principalAmountInWei, _interestRate, block.timestamp, endTime, false, totalAmount);
        emit LoanCreated(loanCounter, msg.sender, address(0), principalAmountInWei, _interestRate, block.timestamp, endTime);
        loanCounter++;

        // Trasferimento dei fondi al contratto
        require(msg.value == principalAmountInWei, "Incorrect amount sent");
    }

    // Funzione per prendere in prestito i fondi da un prestito esistente
    function takeLoan(uint256 loanId) external {
        Loan storage loan = loans[loanId];
        require(loan.borrower != address(0), "Loan does not exist");
        require(!loan.isPaid, "Loan is already paid");
        require(loan.lender == address(0), "Loan is already funded");
        require(msg.sender != loan.borrower, "Borrower cannot take their own loan");

        loan.lender = msg.sender;

        // Trasferimento dei fondi al lender
        payable(loan.lender).transfer(loan.Ethereum);
    }

    // Funzione per ripagare un prestito e inviare i fondi direttamente all'owner
    function repayLoan(uint256 loanId) external payable {
    Loan storage loan = loans[loanId];
    require(!loan.isPaid, "Loan is already paid");
    require(msg.sender == loan.lender, "Only the borrower can repay the loan");

    uint256 interest = FinancialLibrary.calculateInterest(loan.Ethereum, loan.interestRate, loan.startTime, block.timestamp);
    uint256 totalAmount = loan.Ethereum + interest;
    require(msg.value >= totalAmount, "Insufficient funds sent");

    if (block.timestamp > loan.endTime) {
        uint256 penalty = FinancialLibrary.calculatePenalty(loan.Ethereum, loan.endTime, block.timestamp);
        totalAmount += penalty;
        emit LoanLatePayment(loanId, penalty);
    }

    loan.isPaid = true;

    // Trasferimento dei fondi direttamente all'owner
    payable(loan.borrower).transfer(totalAmount);
    emit LoanPaid(loanId, totalAmount);
    }

    // Funzione per annullare un prestito
    function cancelLoan(uint256 loanId) external onlyOwner {
        Loan storage loan = loans[loanId];
        require(!loan.isPaid, "Cannot cancel a paid loan");

        loan.isPaid = true;

        // Trasferimento dei fondi al proprietario
        payable(owner).transfer(loan.Ethereum);
        emit LoanCanceled(loanId);
    }
}