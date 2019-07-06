function A=reconuxx1p(N,dx)
%% this function is used for computing sixth-order CFD scheme
a=12/11;b=3/11;alfa=2/11;
alfa1=126/11;alfa2=11/128;

amat=zeros(N,N);B=zeros(N,N);
     amat(1,1)=1; amat(1,2)=alfa1;% Boundary point one
     B(1,1)=2077/157;B(1,2)=-2943/110;B(1,3)=573/44;B(1,4)=167/99;
     B(1,5)=-18/11;B(1,6)=57/110;B(1,7)=-131/1980;
     
     amat(2,1)=alfa2; amat(2,2)=1; amat(2,3)=alfa2;% Boundary point two
     B(2,1)=585/512;B(2,2)=-141/64;B(2,3)=459/512;B(2,4)=9/32;
     B(2,5)=-81/512;B(2,6)=3/64;B(2,7)=-3/512;
     
     amat(N-1,N-2)=alfa2; amat(N-1,N-1)=1; amat(N-1,N)=alfa2;% Boundary point N-1
     B(N-1,N)=585/512;B(N-1,N-1)=-141/64;B(N-1,N-2)=459/512;B(N-1,N-3)=9/32;
     B(N-1,N-4)=-81/512;B(N-1,N-5)=3/64;B(N-1,N-6)=-3/512;
     
     amat(N,N-1)=alfa1;amat(N,N)=1;% Boundary point N
     B(N,N)=2077/157;B(N,N-1)=-2943/110;B(N,N-2)=573/44;B(N,N-3)=167/99;
     B(N,N-4)=-18/11;B(N,N-5)=57/110;B(N,N-6)=-131/1980;
     
for i=3:N-2
    amat(i,i-1)=alfa; amat(i,i)=1; amat(i,i+1)=alfa;
    B(i,i-2)=b/4;B(i,i-1)=a;B(i,i)=-b/2-2*a;B(i,i+1)=a;B(i,i+2)=b/4;
end
B=B./(dx*dx);
A=inv(amat)*B;
end