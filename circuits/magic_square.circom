pragma circom 2.0.0;

template MagicSquare(size){
    /* 
        Size passed as this template can be 
        used with any magic square size 
    */
    signal input values[size][size];

    /*
        Known formula:
        MagicSum = (size(size^2 + 1)) / 2 
    */
    signal magicSum;
    signal sizeSquared;
    sizeSquared <== size * size;
    magicSum <== (size * (sizeSquared + 1)) / 2; 

    // Checking row by row that the magic sum holds
    for(var i = 0; i < size; i++){
        var sumRow = 0;
        for(var j = 0; j < size; j++){
            sumRow += values[i][j];
        }
        sumRow - magicSum === 0;
    }

    // Checking column by column that the magic sum holds
    for(var i = 0; i < size; i++){
        var sumCol = 0;
        for(var j = 0; j < size; j++){
            sumCol += values[j][i];
        }
        sumCol - magicSum === 0;
    }

    // Checking diagonals
    var mainDiagonal = 0;
    var antiDiagonal = 0;
    for(var i = 0; i < size; i++){
        // Main diagonal check
        mainDiagonal += values[i][i];

        // Anti diagonal check
        antiDiagonal += values[i][size - i - 1];
    }
    mainDiagonal - magicSum === 0;
    antiDiagonal - magicSum === 0;
}

// 5x5 Magic Square for the example
component main = MagicSquare(5);