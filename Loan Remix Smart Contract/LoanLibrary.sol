// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library FinancialLibrary {
    // Funzione per calcolare l'interesse
    function calculateInterest(uint256 principal, uint256 interestRate, uint256 startTime, uint256 endTime) external pure returns (uint256) {
        require(endTime >= startTime, "Invalid time range");
        return (principal * interestRate * (endTime - startTime)) / 1 ether;
    }

    // Funzione per calcolare la penale
    function calculatePenalty(uint256 principal, uint256 loanEndTime, uint256 paymentTime) external pure returns (uint256) {
        require(paymentTime > loanEndTime, "Payment is not late");
        uint256 daysLate = (paymentTime - loanEndTime) / 1 days;
        return (principal * daysLate) / 365;
    }
}