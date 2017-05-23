-- Bad Form
import System.Environment
import Text.ParserCombinators.Parsec

{--
csvFile :: GenParser Char st [[String]]
csvFile =
    do result <- many line
       eof
       return result

-- Each line contains 1 or more cells, separated by a comma
line :: GenParser Char st [String]
line =
     do result <- cells
        eol
        return result

-- Build up a list of cells, parse the first, find out what ends it
cells :: GenParser Char st [String]
cells =
    do first <- cellContent
       next <- remainingCells
       return (first: next)


-- The cell either ends with a comma, indicating that 1 or more
-- cells will follow, or it doesn't, indicating that the end is nigh for this line
remainingCells :: GenParser Char st [String]
remainingCells =
    (char ',' >> cells) -- Found comma? More cells coming
    <|> (return [])     -- No comma? Return [], no more cells
-- <|> tries to consume the left condition unless it doesn't work then tries right  


-- Each cell contains 0 or more characters, which must not
-- be comma or EOL
cellContent :: GenParser Char st String
cellContent =
    many (noneOf ",\n")

-- Lines end on newline '\n'
eol :: GenParser Char st Char
eol = char '\n'

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "unknown" input

fp = "/home/faez/Downloads/StockData.csv"

--}
-- Better Version using sepBy and endBy

csvFile = endBy line eol
line = sepBy cell(char ',')
cell = many (noneOf ",\n")
eol_n = char '\n'

-- carriage-return proof eol:
-- eol = string "\n" <|> string "\n\r" often misses the \r because it returns on \n
-- eol = string "\n\r" <|> string <\n> is not the solution

-- this works better:
eol_do =
  do char '\n'  -- serves as an if for the following line
     char '\r' <|> return '\n'

-- parsec has 'option' for this usecase:
eol_opt = option '\n' (char '\r')

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "(unknown)" input


-- Lookahead: wrap the left side of <|> with try
-- This runs the Right parser for the entire input string (including the part consumedby Left), if Left fails

eol  =  try (string "\n\r")
    <|> try (string "\r\n")
    <|> try (string "\n")
    <|> try (string "\r") 
    <?> try ("end of line") 
