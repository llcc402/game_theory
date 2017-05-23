function [ ] = DrawStraMatrix( a )


b=flipud(a);
n=length(b);
[y x]=find(b);
len=length(y);

for i=1:len
draw(x(i),y(i),'w');
end

[y0 x0]=find(b==0);
len0=length(y0);
for i=1:len0
draw(x0(i),y0(i),'k');
end

set(gca,'XTick',0:n,'YTick',0:n);
grid on;
set(gca,'GridLineStyle','-','YTickLabel',[],'XTickLabel',[]);
