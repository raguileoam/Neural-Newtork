function [ a3,g_W2,g_W1,g_b2,g_b1,z2,z3,s2 ] = feedfordward( P,W1,W2,b1,b2,T )
    %basado en los videos https://www.youtube.com/watch?v=GlcnxUlrtek y https://www.youtube.com/watch?v=4mTKd0QL0TI
        Q=size(P,2);
        z2= P*W1 + b1;
        a2 = tg_sig(z2);
        z3=a2*W2 + b2;
        a3 = tg_sig(z3);
        e=T-a3;  
        s2 = -e.*dTg_sig(z3);
        s1 = s2*W2'.*dTg_sig(z2);
        g_W2=a2'*s2; 
        g_W1=P'*s1;
        g_b2=sum(s2)/Q;
        g_b1=sum(s1)/Q;
end

