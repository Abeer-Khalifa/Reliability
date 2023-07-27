%Exponential calculates first failure of a machine 
num_samples = input('Enter the number of machines: ');
lambda = input('Enter the rate of failures per hour: ');
%Mean time between failures
time_between_failures = exprnd(1/lambda, num_samples, 1); %The exprnd function generates random numbers from the exponential distribution
histogram(time_between_failures) % shows the distribution of time between failures for the machines
xlabel('Time Between Failures (hours)')
ylabel('Count')
title('Distribution of Time Between Failures')
x = 0:10:10000;
grid on
figure;
cdf_values = cdf('Exponential', x, 1/lambda); % X represents time 
plot(x, cdf_values,'color','cyan')
xlabel('Time Between Failures (hours)')
ylabel('Probability')
title('CDF of Exponential Distribution')
grid on
figure;
reliability = (exp(-lambda*time_between_failures)); %calculates the reliability values for each machine
mean_reliability = mean(reliability) ; 
std_dev_reliability = std(reliability);
fprintf('Mean Reliability: %f\n', mean_reliability)
fprintf('Standard Deviation of Reliability: %f\n', std_dev_reliability)
% Poisson CDF for the number of failed machines in one year
failure_rate_year = lambda * 24 * 365;
%generates a random number of failures in one year based on a Poisson distribution
num_failures_Per_Year_number = poissrnd(failure_rate_year);
fprintf('Number of failures per year: %d\n', num_failures_Per_Year_number);
num_failures_Per_Year = 0:failure_rate_year*2; % *2 to ensure that the plot will cover a large range of possible failure counts.
cdf_poisson = poisscdf(num_failures_Per_Year, failure_rate_year);
% Plotting
plot(num_failures_Per_Year, cdf_poisson, 'b')
xlabel('Number of Failed Samples in One Year')
ylabel('Cumulative Probability')
title('Poisson CDF for Failed Samples in One Year')
grid on