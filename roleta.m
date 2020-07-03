function pai=roleta(individuo)
% Somatório da função de aptidão
fitness=individuo(:,end);
[N,m]=size(individuo); 
Soma=sum(fitness);
% Seleção do indivíduo por roleta
ponteiro=rand*(Soma-(1e-3))+(1e-4); %deve pertencer )zero,Soma(
i=1; aux=individuo(1,end);
while(aux<ponteiro)
aux=aux+individuo(i,end); if i==N, i=0;end
i=i+1;
end
pai=individuo(i,:);