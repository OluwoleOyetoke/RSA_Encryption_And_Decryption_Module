function [c] = RSA_Enc(N,e,m)
%This function is used to generate
%a suitable RSA encrypted version of an 
%input message m.  This function takes 
%in three vaiables which are public key N,e &
%Message m

fprintf('\nRSA ENCRYPTION STARTED\n\n');


% Make sure exactly 3 arguments are passed
fprintf('Input validation in progress...\n');
if nargin ~= 3
  error('RSA_Enc:Invalid_No_Of_Arguments_Passed','This function works with 3 arguments N,e & m.')
end

% Make sure N is a positive integer greater than 0
if (N <= 0) || (N~= round(N)) %An integer rounded up should still be equal to itself
  error('RSA_Enc:invalidarguments','N must be a positive integer because p&q are prime numbers.');
end


%verify that m is < N
if(m>N)
   error('m should be a natural number less than N'); 
end

%verify that e is < N
if(e>N)
   error('m should be a natural number less than N'); 
end
fprintf('Input validation completed\n');
fprintf('Starting operation to generate ciphertext...\n');

%Breakdown modulus containing very large powers
mPrime =m;
for loop = 1:e
    tempModAnswer1 = mod(mPrime,N);
    mPrime = tempModAnswer1 * m;
   % fprintf('Modulus Breakdown Stage %d : %d\n', loop, tempModAnswer1);
end 

%Print Answer
fprintf('\nThe Cipher Text for Messgae %d is %d\n', m, tempModAnswer1);
c = tempModAnswer1;