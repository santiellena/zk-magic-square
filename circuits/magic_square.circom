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
    magicSum * 2 <== size * (sizeSquared + 1); 

    // Checking row by row that the magic sum holds
    for(var i = 0; i < size; i++){
        signal sumRow = 0;
        for(var j = 0; j < size; j++){
            sumRow += values[i][j];
        }
        sumRow === magicSum;
    }

    // Checking column by column that the magic sum holds
    for(var i = 0; i < size; i++){
        signal sumCol = 0;
        for(var j = 0; j < size; j++){
            sumCol += values[j][i];
        }
        sumCol === magicSum;
    }

    // Checking diagonals
    signal mainDiagonal = 0;
    signal antiDiagonal = 0;
    for(var i = 0; i < size; i++){
        // Main diagonal check
        mainDiagonal += values[i][i];

        // Anti diagonal check
        antiDiagonal += values[i][size - i - 1];
    }
    mainDiagonal === magicSum;
    antiDiagonal === magicSum;
}

// 5x5 Magic Square for the example
component main = MagicSquare(5);