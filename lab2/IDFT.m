function [s] = IDFT(array)

[M,N] = size(array);
Q = max(M,N);
array_t = zeros(Q,Q);
if M > N
    tmp = zeros(M,M-N);
    array_t = [array,tmp];
    disp('xx');
elseif M < N
    tmp = zeros(N-M,N);
    array_t = [array;tmp];
    disp('yy');
else
    array_t = array;
end
W = zeros(Q,Q);
for m = (1:Q)
    C = 1/ Q;
    for n = (1:Q)
        W(m,n) =C * exp(1i*(2*pi/Q)*(m-1)*(n-1));
    end
end
array_t = double(array_t);
array_t = W*array_t*W';
if M > N
    s = array_t(:,1:N);
    disp('xx');
elseif M < N
    s = array_t(1:M,:);
    disp('yy');
else
    s = array_t;
end

end