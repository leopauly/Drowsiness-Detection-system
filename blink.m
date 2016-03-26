function [word,l,r,f]=blink(left,right)
load('svmclass');

teleft = extractHOGFeatures(left);
releft=predict(cl,teleft);


teright = extractHOGFeatures(right);
reright=predict(cl,teright);

f=reright && releft;
if(f==1)
    word='eyes are active';
else
    word='eyes closing/blinking';
end

if(releft==1)
    l='this eye is open';
else
    l='this eye is closed';
end

if(reright==1)
    r='this eye is open';
else
    r='this eye is closed';
end

%l=int2str(releft);
%r=int2str(reright);

end
