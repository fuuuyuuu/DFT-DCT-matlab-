function [s] = DFT_P(array)

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
    for n = (1:Q)
        W(m,n) = exp(-1i*(2*pi/Q)*(m-1)*(n-1));
    end
end 
W = double(W);
array_t = double(array_t);
array_t = W*array_t*W';

% 取前六个对角线元素，其余置零
for u = 1:Q
    for v = 1:Q
        if (u+v<=7)
            array_t(u,v) = array_t(u,v);
        else
           array_t(u,v) = 0;
        end
    end    
end

%对不为方正的矩阵进行截断
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
