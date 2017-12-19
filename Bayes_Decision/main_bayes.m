% Example of Basian Decision Theory problem from CPE 646
% Likelihood functions
x = -6:.1:10;
% Plotting the Normal Distribution, 0 is the mean and 1 is the square root
% of the varience
norm1 = normpdf(x,0,1);
% Plotting the Normal Distribution, 2 is the mean and 2 is the square root
% of the varience
norm2 = normpdf(x,2,2);
% Likelihood Values for each class
disp('Likelihood value for class 1 when x = 5:');
disp(normpdf(5,0,1));
disp('Likelihood value for class 2 when x = 5:');
disp(normpdf(5,2,2));
% Evidence Distribution
% The evidence distribution function with input x
disp('Evidence value of 5:');
disp(evidence(5));
title('Evidence Distribution Plot)');
% Plot the Likelihood functions and Evidence Distribution
figure(1);
s(1) = subplot(2,1,1);
plot(x,norm1,x,norm2);
s(2) = subplot(2,1,2);
plot(x, evidence(x));
title(s(1), 'Likelihood Functions for Case 1 (Blue) and 2 (Orange)');
title(s(2), 'Evidence Distribution');
% Posterior Probability function for input x
display('Posterior Probability for Case 1 where x = 5:');
display(posterior(5, 0, 1, (3/5)));
display('Posterior Probability for Case 2 where x = 5:');
display(posterior(5, 2, 2, (2/5)));
figure(2);
plot(x, posterior(x, 0, 1, (3/5)), x, posterior(x, 2, 2, (2/5)));
title('Posterior Probability for Case 1 (Blue) and 2 (Orange)');
axis([-6 5 0 1]);
% Likelihood Function Ratio function
display('Likelihood Ratio for x = 5:');
display(ratio(5));
figure(3);
plot(x, ratio(x));
title('Likelihood Ratio of X');
% Likelihood Function Ratio threshold
[M, I] = max(ratio(x));
maxIndex = -5 + 0.1*I;
disp('Max value:');
disp(M);
disp('Max value index:');
disp(maxIndex);
% Bayes Risk function for input x
x = -6:.1:5;
display('Bayes Risk for Case 1 where x = 5:');
display(posterior(5, 0, 1, (3/5)).*posterior(5, 2, 2, (2/5)));
figure(4);
plot(x,  posterior(x, 0, 1, (3/5)).*posterior(x, 2, 2, (2/5)));
title('Bayes Risk');
axis([-6 5 0 1]);