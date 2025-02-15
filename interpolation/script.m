%% Trend Method

X = input('Enter the list of x coordinates: ');
Y = input('Enter the list of y coordinates: ');

[x,y] = leastsquare_function(X,Y);

plot(x,y,'r','Color','r');
hold on
plot(X,Y,'o','Color','b');
%% Newton Method

X = input('Enter the list of x coordinates: ');
Y = input('Enter the list of y coordinates: ');

[x,y] = divdiff_function(X,Y);

plot(x,y,'r','Color','r');
hold on
plot(X,Y,'o','Color','b');



