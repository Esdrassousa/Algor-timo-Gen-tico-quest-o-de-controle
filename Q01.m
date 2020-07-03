close all, clear all, clc

%% Quest�o 01

N=10;
%taxa de cruzamento 
tax_cr=0.20;
tax_mut=0.5;
gmax = 40;

K1min=0; K1max=15;
K4min=0; K4max=1;
bits=8;

cromossomo_K1=round(rand(N,bits));
cromossomo_K4=round(rand(N,bits));

%% 1.Primeira gera��o

K1_i = K1min+(K1max-K1min)*(bin2dec(num2str(cromossomo_K1,bits))/((2^bits)-1));
K4_i = K4min+(K4max-K4min)*(bin2dec(num2str(cromossomo_K4,bits))/((2^bits)-1));

%K1=K1min+(K1max-K1min)*rand(N,1)
%K4=K4min+(K4max-K4min)*rand(N,1)

for j=1:1:N
    [J(j,:) A(j,:)]=Meio_ambiente_matrix(K1_i(j,:), K4_i(j,:));    
end

individuo=[cromossomo_K1 cromossomo_K4 K1_i K4_i J];

feval_media=mean(individuo(:,end));
n_melhor=find(individuo(:,end)==max(individuo(:,end)));
n_pior=find(individuo(:,end)==min(individuo(:,end)));

melhor=individuo(n_melhor(1),:);
pior=individuo(n_pior(1),:);

%%%%vetores de armazenamento
i=1; F_i=[]; F_e=[]; F_o=[]; erro=1;

while (i<=gmax)&&(erro(1,end) > 0.01)
  
for k=1:N  

pai(1,:)=roleta(individuo);
pai(2,:)=roleta(individuo);

filho=crossover_bin_1(pai,K1min,K1max , K4min , K4max, tax_cr);

if(filho(1,end)>=filho(2,end)),
individuo(k,:)=filho(1,:);

else
individuo(k,:)=filho(2,:);
end

end


individuo = mutacao_bit(individuo,tax_mut);

[individuo,melhor,pior] = elitismo(individuo,melhor,pior);

erro(1,i)=abs(melhor(end))-(pior(end));


feval_media=mean(individuo(:,end));
F_i=[F_i feval_media];
F_e=[F_e melhor(end)];
F_o=[F_o pior(end)];
i=i+1;

disp('Geração');
i
individuo

%[i, erro(1,end)]
end
disp('Valores');
K1=melhor(1,end-2)
K4=melhor(1,end-1)
J=melhor(1,end)


%% Plots
%figure(1);
%subplot(311)
plot(F_e, 'r')

subplot(312)
plot(F_e, 'b')

%subplot(313)
%plot(F_o, 'k')


%figure(2)
%plot(erro, 'ko-')


%     
% 
