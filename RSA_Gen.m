function [N d e]  = RSA_Gen(p,q )
%This function is used to generate
%a suitable private and public key for
%RSA Encryption. These keys are generated 
%by supplying the function with a
%suitable p & q which are prime numbers.

fprintf('\nRSA PUBLIC AND PRIVATE KEY GENERATOR STARTED\n\n');

% Make sure exactly 2 arguments are passed
fprintf('Input validation in progress...\n');
if nargin ~= 2
  error('RSA_Gen:Invalid_No_Of_Arguments_Passed','This function works with 2 arguments p & q.')
end

% Make sure p and q are positive integer greater than 0
if ((p <= 0) || (q <= 0) || (p~= round(p)) || (q~= round(q))) %An integer rounded up should still be equal to itself
  error('RSA_Gen:Invalid_Argument_Passed','p and q must be positive integers.')
end


%Check if p & q are prime numbers
if(isprime(p)==0)
    error('Invalid input. p should be a prime number');
end
if (isprime(q)==0)
      error('Invalid input. q should be a prime number');
end

fprintf('Input validation completed\n');
fprintf('Starting operation to generate keys...\n');
   
%Do N= p*q
N = p*q;

%Do z = (p-1)(q-1)
z = (p-1)*(q-1);

%Generate a suitable e which is < N and has no factors with z
loopChecker=1;
while(loopChecker==1)
    e = randi([1 (N-1)],1,1);
if((gcd(e(1),z)==1) && (z~=1 && e(1)~=1) && (z~=0)) 
    loopChecker=0;
else %Go over the loop again
    loopChecker=1;
end
end

%Choose a suitable 'd' such that ed-1 is divisible by z 
loopChecker=1;
while(loopChecker==1)
    d = randi([1 10000],1,1); % generate 1 random number between 1 and 10000
 
temp = (e(1)*d(1))-1;
if(mod(temp,z)==0)  %Go over the loop again
    loopChecker=0;
else
    loopChecker=1; 
end
end

%Display Answer
disp('Answer:');
fprintf('Public Key = (%d , %d) \n',N,e(1));
fprintf('Private Key = (%d, %d)\n',N,d(1));
fprintf('N = %d\n',N);
fprintf('d = %d\n',d(1));
fprintf('e = %d\n',e(1));

