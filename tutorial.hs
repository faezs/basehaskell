import Data.List
import System.IO

--Int -2^63 2^63, 
--Integer (unbounded integer), 
--Float and Double (good for 9 dec places)
--Bool (True, False)
--Char
--Tuple

sumOfNums = sum [1..1000]
addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4
modEx = mod 5 4
modExin = 5 `mod` 4

--negative numbers must be written with brackets because of operator composition
-- prefix operators can be converted to infix by surrounding them with backticks

--built-in math

piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9**2
truncateVal= truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999


--also sin, cos, tan, asin, atan, ascos, sinh, tanh, cosh, asinh, atanh, acosh

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

--lists are singly linked and can only be added to at the front.

--List Creation and Manipulation:

numbers = 2:7:21:66:[] --cons operator, creates a list

listofLists = [[3, 5, 7],[11, 13, 17]] --try accessing recursively

primeNumbers = [3, 5, 7,11] 

morePrimes = primeNumbers ++ [13, 13 ,19, 23, 29]

--Add to Front
add2 = 2:morePrimes

lenPrime = length morePrimes

revPrimes = reverse morePrimes
isListEmpty = null morePrimes
secondPrime = morePrimes !! 1 --zero-index via !!

firstPrime = head morePrimes
lastPrime = last morePrimes
primeInit = init morePrimes

first3Primes = take 3 morePrimes 
removedPrimes = drop 3 morePrimes --everything but the first 3
is7InList = elem 7 morePrimes

maxPrime = maximum morePrimes
minPrime = minimum morePrimes
product = Data.List.product morePrimes

zeroToTen = [0..10]

evenlist = [2,4..20]

infinitelist = [x|<-10**x, x>0 ]

succ 0 -- returns the successor of anything

min elem1 elem2 --compares 2
max elem1 elem2 --compares 2

--Awesome Combinatons

succ 9 + max 5 4 + 1

doubleMe x = x + x

{-
Category Theory:
- Objects


-Morphisms

--Structure Preserving Maps Between Objects

--Every Morphism maps a source object to a target object.

--Every Object has an Identity Morphism

--Morphisms are Closed under Compositions

--(Closed: Compositions of morphisms are morphisms themselves, only when the source and target Types align)

--Associativity


Unifying Language of Math, a way to talk about Stuff, isn't Stuff itself

Syntactic Sugary

e = Set, category of Sets, Very Unstructured Cateogry:

Objects consist of Sets,
Morphisms consists of functions of sets.

The structure is Membership and Cardinality, how large are they and what do they contain?


e = MAN, Category of Manifolds, Quite a Lot of Structure

Objects : Smooth Manifolds
Morphisms : Smooth Maps
Structure : Topology and Caculus-Friendly

e = VECT, Category of Finite Dimensional VectorSpaces

Objects : Finite Dimensional Vectorspaces
Morphisms : Linear Maps
Structure : Linearity, Isomorphisms

e = TopVectSp, Category of Topological Vector Spaces

Objects: Topological VectorSpaces
Morphisms: Continous Linear Maps
Structures: Linearity and Topology


e = Haskell Types

(Haskell) Types == (Mathematical) Spaces --Russell and Whitehead
Structure: kaaaafi


-}


 

