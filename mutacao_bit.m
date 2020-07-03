function out=mutacao_bit(individuo,tax_mut)
[m,n]=size(individuo);
bits=n-3;
for k=1:m
if(rand<tax_mut) %se a taxa de mutação for satisfeita
mut=round((bits-1).*rand+1);
individuo(k,mut)=~individuo(k,mut); %um dos bits serão modificados
out=individuo;
else out=individuo;
end
end