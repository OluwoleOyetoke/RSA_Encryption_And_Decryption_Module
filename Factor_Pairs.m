function pq = factorpairs(N)
%This function is used to generate the factor pairs of integers
%The function takes in one positive integer N and breaks it down into its
%component factor pairs.

fprintf('\nFACTOR PAIR GENERATOR STARTED\n\n');

% Make sure exactly 1 argument is passed
if nargin ~= 1
  error('Factor_Pairs:Invalid_No_Of_Arguments_Passed','This function works with 1 argument N.');
end

% Make sure N is a positive integer greater than 0
if (N <= 0) || (N~= round(N)) %An integer rounded up should still be equal to itself
  error('Factor_Pairs:invalidarguments','N must be a positive integer.');
end

% a few simple special cases
if N == 1
  pq = [1 1]; % one isn't a prime number, but its only got 1 and itself as multiples
  return;
elseif isprime(N) %prime numbers only have 1 and itself as multiples
  pq = [1 N];
  return;
end

limit = N/2;
factorPairsArray=[1 N];
rightSide = [N];

for numberCount=2:limit
   tempAnswer = N/ numberCount;
%if statement is used to make sure the factor pairs stop at the right place
    if(round(tempAnswer)==tempAnswer) && (numberCount~=1) && (isempty(find(rightSide==numberCount))==1) 
        currentPairsArray = [numberCount tempAnswer];
        rightSide = [rightSide tempAnswer];
       factorPairsArray = [factorPairsArray;currentPairsArray];
   
    elseif((tempAnswer-numberCount==1) || (tempAnswer-numberCount==1) || (isempty(find(rightSide==numberCount))==0))
       break; 
    end 
end
pq = factorPairsArray;
fprintf('Factor pairs p, q of %d are listed below\n', N);
disp(factorPairsArray);