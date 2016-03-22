function [word,l,r,f]=blink(left,right)
load('svmclass');

teleft = extractHOGFeatures(left);
releft=predict(cl,teleft);


teright = extractHOGFeatures(right);
reright=predict(cl,teright);

f=reright && releft;
if(f==1)
    word='active';
else
    word='dozing';
end

l=int2str(releft);
r=int2str(reright);

end
