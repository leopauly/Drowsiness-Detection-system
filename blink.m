function [word,l,r,f]=blink(left,right)
load('svmclass');

teleft = extractHOGFeatures(left);
releft=predict(cl,teleft);


teright = extractHOGFeatures(right);
reright=predict(cl,teright);

f=reright && releft;
if(f==1)
    word='eyes active';
else
    word='blinking';
end

if(releft==1)
    l='Tracking Left Eye: Eye status - Open ';
else
    l='Tracking Left Eye:Eye status - Closed';
end

if(reright==1)
    r='Tracking Right Eye: Eye status -Open';
else
    r='Tracking Right Eye: Eye status - Closed';
end


%l=int2str(releft);
%r=int2str(reright);

end
