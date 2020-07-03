function [individuo,melhor , pior]=elitismo(individuo,melhor ,pior)
% Melhor e pior desta geração
n_melhor=find(individuo(:,end)==max(individuo(:,end))); %melhor individuo
n_pior=find(individuo(:,end)==min(individuo(:,end)));
%pior individuo
if individuo(n_melhor(1),end)>=melhor(end);
melhor=individuo(n_melhor(1),:);
end
if individuo(n_pior(1),end)>=pior(end);
pior=individuo(n_pior(1),:);
end
