function[T]=jingxi(A,dt,M)
%% this function is used for computing matrix index
I=eye(size(A));
Ta=A*dt+(A*dt)^2*(I+(A*dt)/3+(A*dt)^2/12)/2;% Taylor expansion
for i=1:M
  Ta=2*Ta+Ta^2;
end
T=I+Ta;
