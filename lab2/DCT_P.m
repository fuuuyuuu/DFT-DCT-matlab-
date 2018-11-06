function [s] = DCT_P(array)

[M,N] = size(array);
Q = max(M,N);
array_t = ones(Q,Q);
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
    if m == 1
        C = sqrt(1/Q);
    else
        C = sqrt(2/Q);
    end
    for n = (1:Q)
        W(m,n) = C*cos((pi/2/Q)*(m-1)*(2*n-1));
    end
end    
array_t = W*array_t*W';

for u = 1:Q
    for v = 1:Q
        if (u+v<=7)
            array_t(u,v) = array_t(u,v);
        else
            array_t(u,v) = 0;
        end
    end
    
end

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