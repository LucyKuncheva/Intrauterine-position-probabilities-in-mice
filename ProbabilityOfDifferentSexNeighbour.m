function ProbabilityOfDifferentSexNeighbour
clc
close all

% p = probability of female gender (symmetric for male)
% K = number of embryos


figure('Un','N','Pos',[0.2,0.3,0.6,0.3]) % bar plot Case 1 p = 0.5
K = [4,6,8]; [a1,a2,a3] = p_case1(K,0.5);
for i = 1:3
    prepare_figure(i,[0,0.6])
    bar([a1(i),a2(i),a3(i)])
    title(sprintf('{\\it K} = %i, {\\it p} = 0.5',K(i)))
end

figure('Un','N','Pos',[0.2,0.3,0.6,0.3]) % bar plot Case 1 different p
p = 0.4:-.1:0.2; [a1,a2,a3] = p_case1(6,p);
for i = 1:3
    prepare_figure(i,[0,0.6])
    bar([a1(i),a2(i),a3(i)],'Facecolor',[0.3 0.3 1])
    title(sprintf('{\\it K} = 6, {\\it p} = %.1f',p(i)))
end

figure('Un','N','Pos',[0.2,0.3,0.6,0.3]) % bar plot Case 2 n = K/2
K = [4,6,8];
for i = 1:3
    [a1,a2,a3] = p_case2(K(i),K(i)/2);
    prepare_figure(i,[0,0.8])
    bar([a1,a2,a3],'FaceColor',[0.6 0 0])
    title(sprintf('{\\it K} = %i, {\\it n} = %i',K(i),K(i)/2))
end

figure('Un','N','Pos',[0.2,0.3,0.6,0.3]) % bar plot Case 2 different n
K = [4 6 6];
n = [1 2 1];
for i = 1:3
    [a1,a2,a3] = p_case2(K(i),n(i));
    prepare_figure(i,[0,0.8])
    bar([a1,a2,a3],'FaceColor',[1 0.3 0.3])
    title(sprintf('{\\it K} = %i, {\\it n} = %i',K(i),n(i)))
end


%% Case 1
[P0,P1,P2] = p_case1(2:100,0.5);
indextoplot = [1:19,49,99];
zz = [1:numel(indextoplot)-2 24 30];
zzz = [1:2:numel(indextoplot)-2 24 30];
prepare_figure(0,[0,0.6])
plot(P0(indextoplot(1:end-2)),'ks-')
plot(P1(indextoplot(1:end-2)),'r^-')
plot(P2(indextoplot(1:end-2)),'bo-')
plot(zz(end-2:end),P0(indextoplot(end-2:end)),'ks:')
plot(zz(end-2:end),P1(indextoplot(end-2:end)),'r^:')
plot(zz(end-2:end),P2(indextoplot(end-2:end)),'bo:')
set(gca,'YLim',[0 0.6],'FontSize',12,'XTick',zzz,...
    'XTickLabel',[2:2:20,50,100],'YTick',0:0.05:0.6)
xlabel('Number of foetuses in a horn ({\itK})')
ylabel('Probability')
legend('0','1','2','Location','SE')
title('{\it p} = 0.5')

[P0,P1,P2] = p_case1(2:100,0.3);
indextoplot = [1:19,49,99];
zz = [1:numel(indextoplot)-2 24 30];
zzz = [1:2:numel(indextoplot)-2 24 30];
prepare_figure(0,[0,0.6])
plot(P0(indextoplot(1:end-2)),'ks-')
plot(P1(indextoplot(1:end-2)),'r^-')
plot(P2(indextoplot(1:end-2)),'bo-')
plot(zz(end-2:end),P0(indextoplot(end-2:end)),'ks:')
plot(zz(end-2:end),P1(indextoplot(end-2:end)),'r^:')
plot(zz(end-2:end),P2(indextoplot(end-2:end)),'bo:')
set(gca,'YLim',[0 0.6],'FontSize',12,'XTick',zzz,...
    'XTickLabel',[2:2:20,50,100],'YTick',0:0.05:0.6)
xlabel('Number of foetuses in a horn ({\itK})')
ylabel('Probability')
legend('0','1','2','Location','SE')
title('{\it p} = 0.3')


%% Case 2
clear P0 P1 P2
for i = 2:100
    [P0(i-1),P1(i-1),P2(i-1)] = p_case2(i,i/2);
end
indextoplot = [1:19,49,99];
zz = [1:numel(indextoplot)-2 24 30];
zzz = [1:2:numel(indextoplot)-2 24 30];
prepare_figure(0,[0,0.6])
plot(P0(indextoplot(1:end-2)),'ks-')
plot(P1(indextoplot(1:end-2)),'r^-')
plot(P2(indextoplot(1:end-2)),'bo-')
plot(zz(end-2:end),P0(indextoplot(end-2:end)),'ks:')
plot(zz(end-2:end),P1(indextoplot(end-2:end)),'r^:')
plot(zz(end-2:end),P2(indextoplot(end-2:end)),'bo:')
set(gca,'YLim',[0 1],'FontSize',12,'XTick',zzz,...
    'XTickLabel',[2:2:20,50,100],'YTick',0:0.25:1)
xlabel('Number of foetuses in a horn ({\itK})')
ylabel('Probability')
legend('0','1','2','Location','SE')
title('{\it n} = {\it K}/2')

%% Case 2, n = 3

clear P0 P1 P2
for i = 2:100
    [P0(i-1),P1(i-1),P2(i-1)] = p_case2(i,3);
end
indextoplot = [1:19,49,99];
zz = [1:numel(indextoplot)-2 24 30];
zzz = [1:2:numel(indextoplot)-2 24 30];
prepare_figure(0,[0,0.6])
plot(P0(indextoplot(1:end-2)),'ks-')
plot(P1(indextoplot(1:end-2)),'r^-')
plot(P2(indextoplot(1:end-2)),'bo-')
plot(zz(end-2:end),P0(indextoplot(end-2:end)),'ks:')
plot(zz(end-2:end),P1(indextoplot(end-2:end)),'r^:')
plot(zz(end-2:end),P2(indextoplot(end-2:end)),'bo:')
set(gca,'YLim',[0 1],'FontSize',12,'XTick',zzz,...
    'XTickLabel',[2:2:20,50,100],'YTick',0:0.25:1)
xlabel('Number of foetuses in a horn ({\itK})')
ylabel('Probability')
legend('0','1','2','Location','E')
title('{\it n} = 3')

%% Variable p (Case 1) / n (Case 2)
Q = []; P =[];
K = 100;
ind = 1;
xp = linspace(0,1,15);
xn = round(K*xp);
for p = xp
    n = round(K*p);
    [P(ind,1),P(ind,2),P(ind,3)] = p_case1(K,p);
    [Q(ind,1),Q(ind,2),Q(ind,3)] = p_case2(K,n);
    ind = ind + 1;
end

figure, hold on, grid on
plot(xp,P(:,1),'k*-')
plot(xp,P(:,2),'rx-')
plot(xp,P(:,3),'bd-')
set(gca,'FontSize',12)
xlabel('Probability of Female')
ylabel('Probability')
legend('0','1','2','Location','N')


figure, hold on, grid on
plot(xn,Q(:,1),'k*--')
plot(xn,Q(:,2),'rx--')
plot(xn,Q(:,3),'bd--')
set(gca,'FontSize',12)
xlabel('Number of Females in a horn')
ylabel('Probability')
legend('0b','1b','2b','Location','N')

%% Upstream male Case 1
K = 10;
m = 1:K;

pM3 = 1 - 0.3.^m;
pM5 = 1 - 0.5.^m;
pM6 = 1 - 0.6.^m;

figure('Un','N','Pos',[0.2,0.3,0.6,0.38])
subplot(1,2,1)
hold on, grid on
plot(pM3,'k^-')
plot(pM5,'bo-')
plot(pM6,'rs-')
set(gca,'FontSize',14)
xlabel('Position {\it y}')
ylabel('Probability')
legend('{\it p}_{female} = 0.3','{\it p}_{female} = 0.5',...
    '{\it p}_{female} = 0.6','Location','SE')
set(gca,'Xlim',[1,K],'XTick', 1:K,...
    'XTickLabel',2:K+1,'YLim',[0.4 1.1],'YTick',0.4:0.1:1)

%% Upstream male Case 2
K = 10;
[qM3, qM5, qM6] = deal(ones(1,K));
for m = 1:K
    if m<=3
        qM3(m) = 1 - nchoosek(3,m)/nchoosek(K,m);
    end
    if m<=5
        qM5(m) = 1 - nchoosek(5,m)/nchoosek(K,m);
    end
    if m<=6
        qM6(m) = 1 - nchoosek(6,m)/nchoosek(K,m);
    end
end

subplot(1,2,2)
hold on, grid on
plot(qM3,'k^--')
plot(qM5,'bo--')
plot(qM6,'rs--')

set(gca,'FontSize',14)
xlabel('Position {\it y}')
ylabel('Probability')
legend('3 female','5 female','6 female','Location','SE')
set(gca,'Xlim',[1,K],'XTick', 1:K,...
    'XTickLabel',2:K+1,'YLim',[0.4 1.1],'YTick',0.4:0.1:1)

end


function prepare_figure(spi,yl)
if spi>0 % wide figure, subplot index
    subplot(1,3,spi)
    hold on
    set(gca,'XTickLabel',0:2,'FontSize',12,'Ylim',yl)
    grid on
    xlabel('{\it X}')
    ylabel('Probability')
else
    figure, hold on, grid on, set(gca,'FontSize',12)
    ylabel('Probability')
end
end

function [P0,P1,P2] = p_case1(K,p)
P0 = 2./K .* (p.^2 + (1-p).^2) + (K-2)./K .* (p.^3 + (1-p).^3); % X = 0
P1 = 2 * p .* (1-p); % X = 1
if numel(K) > 1
    P1 = repmat(2 * p .* (1-p),1,numel(K)); % X = 1
end
P2 = (K-2)./K .* p .* (1-p); % X = 2
end

function [Q0,Q1,Q2] = p_case2(K,n)
Q0 = (n^2.*(n-1)+(K-n).^2.*(K-n-1))./(K.^2.*(K-1)); % X = 0
Q1 = 2*n.*(K-n)./(K.*(K-1)); % X = 1
Q2 = n.*(K-n).*(K-2)./(K.^2.*(K-1)); % X = 2
end