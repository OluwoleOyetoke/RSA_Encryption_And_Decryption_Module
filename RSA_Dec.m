function [m] = RSA_Enc(N,d,c)
%This function is used to decrypt a cipher text
%usinf the given private keys (N,d)
% This function takes in three vaiables 
%which are the private key N,d &
%Ciphertext c

fprintf('\n RSA CIPHER TEXT DECIPHERER STARTED\n\n');


% Make sure exactly 3 arguments are passed
fprintf('Input validation in progress...\n');
if nargin ~= 3
  error('RSA_Dec:Invalid_No_Of_Arguments_Passed','This function works with 3 arguments N,d & c.')
end

%verify that c is < N
if(c>N)
   error('c should be a natural number less than N'); 
end

fprintf('Input validation completed\n');
fprintf('Starting operation to generate plain text...\n');

%Computing the power of large numbers
cPrime =c;
for loop = 1:d
       tempModAnswer = mod(cPrime,N);
       cPrime = c*tempModAnswer;
      % fprintf('Modulus Breakdown Stage %d : %d\n', loop, tempModAnswer);
end 

%Print Answer
fprintf('The Plain Text for Ciphertext %d is %d\n', c, tempModAnswer);
m = [tempModAnswer];