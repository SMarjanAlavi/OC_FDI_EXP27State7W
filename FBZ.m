function [Banned_zone_SCF] = FBZ(Levels)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%Fault Banned Zones for short-circuit fault in Q1-Q6
i=1;
F=[1:Levels^2;1:Levels^2;1:Levels^2;1:Levels^2;1:Levels^2;1:Levels^2];
for C=[0:Levels-1];
for B=[0:Levels-1];
for A=[0];
F(1,i)=Levels^2*C+Levels*B+A;
i=i+1;
end;end;end
i=1;
for C=[0:Levels-1];
for B=[0:Levels-1];
for A=[Levels-1];
F(2,i)=Levels^2*C+Levels*B+A;;
i=i+1;
end;end;end
i=1;
for C=[0:Levels-1];
for A=[0:Levels-1];
for B=[0];
F(3,i)=Levels^2*C+Levels*B+A;;
i=i+1;
end;end;end
i=1;
for C=[0:Levels-1];
for A=[0:Levels-1];
for B=[Levels-1];
F(4,i)=Levels^2*C+Levels*B+A;;
i=i+1;
end;end;end
i=1;
for A=[0:Levels-1];
for B=[0:Levels-1];
for C=[0];
F(5,i)=Levels^2*C+Levels*B+A;;
i=i+1;
end;end;end
i=1;
for A=[0:Levels-1];
for B=[0:Levels-1];
for C=[Levels-1];
F(6,i)=Levels^2*C+Levels*B+A;;
i=i+1;
end;end;end
Banned_zone_SCF=(sort(F'))';
end
