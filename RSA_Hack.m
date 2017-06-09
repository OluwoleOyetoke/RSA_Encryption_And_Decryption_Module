function [m] = RSA_Hack(N,e,c)

%This function is used to get posssible plaintext by analysing the cipher 
%text and the public key of the sender. The function takes in 3 arguments N, e and c 
%and produces a vector of all the possible unique messages

fprintf('\nRSA HACK STARTED\n\n');

m=[];
% Make sure exactly 3 arguments are passed
fprintf('Input validation in progress...\n');

if nargin ~= 3
  error('RSA_Hack:Invalid_No_Of_Arguments_Passed','This function works with 3 arguments N,e & c.')
end

%verify that N is < 10^8
if(N>10^8)
   error('N should be a natural number less than 10^8'); 
end

fprintf('Input validation completed\n');

%Get the Factors Pairs of N
fprintf('Moving on to get all possible factors of N...\n');
NFactors = Factor_Pairs(N); %An extra function we wrote to help generate this values
len = length(NFactors); %Get the total number of factor pairs available
fprintf('All possible factor pairs of N have been gotten. Each pair will be analysed to get possible ms\n');
fprintf('Factor pair analysis in progress....\n');


%Use each factor pair to generate different possible ms
for loop=2:len %do not bother using the first factor pair 1*N cos it will give z=0;
p = NFactors(loop,1);
q = NFactors(loop,2);
fprintf('\nFactors p, q = : %d, %d\n', p,q);
%Factors(N);


%Get Z
z = (p-1)*(q-1);
fprintf('derived z: %d\n', z);

%Validate that p & q are prime numbers
if(isprime(p)==0)
    error('Invalid input. p should be a prime number');
end
if (isprime(q)==0)
      error('Invalid input. q should be a prime number');
end

%Check that e doesnt have any common factor with z
if((gcd(e,z)~=1) || (z==1 && e==1) || (z==0)) 
    fprintf('e & z i.e %d & %d have common factors. Moving over to the next pair\n', e, z);
    continue;
end

% we will limit the posible values of our d to the first possible 1 million
maxPossibled = 100000;
for loopVal=1:maxPossibled
d = loopVal; % generate 1 random number between 1 and 100000
temp = (e*d(1));
if(mod(temp,z)==1)  %d must satisfy  --> ed mod z = 1
  fprintf('derived d: %d\n', d(1));
% Calling our RSA Decipher function and saving the cumulative result in our
  m = [m RSA_Dec(N,d(1),c)];
end
end

if isempty(m)==1
    error('the possible value of d needed is greater than the limit of %d set', maxPossibled);
end

end
len2 = length(m);
fprintf('\nBy analyzing all the copairs and limiting the generated d to between 1 and %d, ALL\n',maxPossibled);
fprintf('the possible message(s) from the public key %d,%d and cipher text %d are/is: ', N,e,c);
for loop=1:len2
    fprintf('%d ', m(loop));
end
uniquem = unique(m);
len3 = length(uniquem);
fprintf('\n\nFinally, the UNIQUE possible message(s) from the public key %d,%d for cipher text %d are/is:     ', N,e,c);
for loop=1:len3
    fprintf('%d ', uniquem(loop));
end
m=uniquem; %return only the unique messages
